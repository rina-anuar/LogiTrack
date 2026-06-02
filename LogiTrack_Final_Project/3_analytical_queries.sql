-- ================================================================
-- LogiTrack — Logistics and Delivery Analytics
-- SECTION 4 — ANALYTICAL QUERIES (exactly 6)
-- ================================================================

USE logitrack;

-- ----------------------------------------------------------------
-- QUERY 1
-- Top 5 drivers with highest number of on-time deliveries
-- and their average delivery duration (in hours).
-- Demonstrates: JOIN, aggregation, filtering, ORDER BY + LIMIT.
-- ----------------------------------------------------------------
SELECT
    d.driver_id,
    CONCAT(d.first_name, ' ', d.last_name)                                          AS driver_name,
    COUNT(*)                                                                        AS on_time_deliveries,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, dl.pickup_date, dl.actual_date) / 60.0), 2)     AS avg_duration_hours
FROM deliveries dl
JOIN drivers d ON d.driver_id = dl.driver_id
WHERE dl.status = 'delivered'
  AND dl.delay_minutes = 0
  AND dl.actual_date IS NOT NULL
GROUP BY d.driver_id, d.first_name, d.last_name
ORDER BY on_time_deliveries DESC, avg_duration_hours ASC
LIMIT 5;

-- ----------------------------------------------------------------
-- QUERY 2
-- Warehouses whose AVERAGE delivery delay is higher than the
-- overall company-wide average delay.
-- Demonstrates: nested subquery in HAVING, aggregation, JOIN.
-- ----------------------------------------------------------------
SELECT
    w.warehouse_id,
    w.warehouse_name,
    ROUND(AVG(dl.delay_minutes), 2) AS avg_delay_minutes,
    COUNT(*)                        AS total_deliveries
FROM deliveries dl
JOIN warehouses w ON w.warehouse_id = dl.warehouse_id
GROUP BY w.warehouse_id, w.warehouse_name
HAVING AVG(dl.delay_minutes) > (
        SELECT AVG(delay_minutes) FROM deliveries
)
ORDER BY avg_delay_minutes DESC;

-- ----------------------------------------------------------------
-- QUERY 3
-- Routes where the number of DELAYED deliveries is greater than
-- the number of ON-TIME deliveries.
-- Demonstrates: conditional aggregation with CASE inside SUM,
-- HAVING with comparison of two aggregates, JOIN to cities.
-- ----------------------------------------------------------------
SELECT
    r.route_id,
    co.city_name              AS origin_city,
    cd.city_name              AS dest_city,
    SUM(CASE WHEN dl.status = 'delayed' THEN 1 ELSE 0 END) AS delayed_count,
    SUM(CASE WHEN dl.status = 'delivered'
              AND dl.delay_minutes = 0 THEN 1 ELSE 0 END)  AS on_time_count
FROM deliveries dl
JOIN routes r  ON r.route_id       = dl.route_id
JOIN cities co ON co.city_id       = r.origin_city_id
JOIN cities cd ON cd.city_id       = r.dest_city_id
GROUP BY r.route_id, co.city_name, cd.city_name
HAVING delayed_count > on_time_count
ORDER BY delayed_count DESC;

-- ----------------------------------------------------------------
-- QUERY 4
-- Rank cities (as shipment ORIGINS) by total shipment volume
-- using a WINDOW FUNCTION.
-- Demonstrates: window function RANK() OVER (...), JOINs.
-- ----------------------------------------------------------------
SELECT
    c.city_id,
    c.city_name,
    ROUND(SUM(s.volume_m3), 2)                                  AS total_volume_m3,
    RANK() OVER (ORDER BY SUM(s.volume_m3) DESC)                AS volume_rank
FROM shipments s
JOIN warehouses w ON w.warehouse_id = s.warehouse_id
JOIN cities     c ON c.city_id      = w.city_id
GROUP BY c.city_id, c.city_name
ORDER BY volume_rank;

-- ----------------------------------------------------------------
-- QUERY 5
-- Classify deliveries by performance using CASE WHEN:
--   On Time           : status delivered AND delay = 0
--   Slightly Delayed  : delay between 1 and 180 minutes
--   Seriously Delayed : delay > 180 minutes
--   Failed            : status failed
-- Demonstrates: CASE WHEN analytical logic, GROUP BY.
-- ----------------------------------------------------------------
SELECT
    CASE
        WHEN status = 'failed'                              THEN 'Failed'
        WHEN status = 'delivered' AND delay_minutes = 0     THEN 'On Time'
        WHEN delay_minutes BETWEEN 1 AND 180                THEN 'Slightly Delayed'
        WHEN delay_minutes > 180                            THEN 'Seriously Delayed'
        ELSE 'Other'
    END                                                     AS performance_category,
    COUNT(*)                                                AS delivery_count,
    ROUND(AVG(delay_minutes), 2)                            AS avg_delay
FROM deliveries
GROUP BY performance_category
ORDER BY delivery_count DESC;

-- ----------------------------------------------------------------
-- QUERY 6
-- Performance: filter deliveries by warehouse_id + date range.
-- Uses index-friendly range condition (no DATE() wrapper on column).
-- The composite index is created in SECTION 8.
-- ----------------------------------------------------------------
SELECT delivery_id, shipment_id, driver_id, status, delay_minutes, actual_date
FROM deliveries
WHERE warehouse_id = 1
  AND pickup_date >= '2025-09-01'
  AND pickup_date <  '2026-01-01';
