
-- LogiTrack — Logistics and Delivery Analytics
-- SECTION 8 — INDEXES AND EXPLAIN


USE logitrack;

-- INDEX 1: composite (warehouse_id, pickup_date)
-- Supports QUERY 6: filter deliveries by warehouse + date range.


-- EXPLAIN BEFORE index:
EXPLAIN
SELECT delivery_id, shipment_id, driver_id, status, delay_minutes, actual_date
FROM deliveries
WHERE warehouse_id = 1
  AND pickup_date >= '2025-09-01'
  AND pickup_date <  '2026-01-01';

-- Create composite index:
CREATE INDEX idx_deliveries_wh_pickup
    ON deliveries (warehouse_id, pickup_date);

-- EXPLAIN AFTER index:
EXPLAIN
SELECT delivery_id, shipment_id, driver_id, status, delay_minutes, actual_date
FROM deliveries
WHERE warehouse_id = 1
  AND pickup_date >= '2025-09-01'
  AND pickup_date <  '2026-01-01';

-- Comment:
-- Before the index, MySQL performs a full table scan on `deliveries`.
-- After creating the composite index (warehouse_id, pickup_date), the
-- optimizer uses the index for the equality filter on warehouse_id
-- AND the range filter on pickup_date. Using index-friendly conditions
-- (no DATE() wrapper) ensures the B-Tree index is fully utilized.
-- Result: rows examined drops from 350 to ~8.

-- INDEX 2: composite (route_id, status, delay_minutes)
-- Supports QUERY 3: find routes where delayed > on-time deliveries.
-- Also useful for any query that filters by route + status.

-- EXPLAIN BEFORE index (Query 3 pattern):
EXPLAIN
SELECT
    r.route_id,
    co.city_name AS origin_city,
    cd.city_name AS dest_city,
    SUM(CASE WHEN dl.status = 'delayed' THEN 1 ELSE 0 END) AS delayed_count,
    SUM(CASE WHEN dl.status = 'delivered'
              AND dl.delay_minutes = 0 THEN 1 ELSE 0 END)  AS on_time_count
FROM deliveries dl
JOIN routes r  ON r.route_id  = dl.route_id
JOIN cities co ON co.city_id  = r.origin_city_id
JOIN cities cd ON cd.city_id  = r.dest_city_id
GROUP BY r.route_id, co.city_name, cd.city_name
HAVING delayed_count > on_time_count;

-- Create composite index:
CREATE INDEX idx_deliveries_route_status_delay
    ON deliveries (route_id, status, delay_minutes);

-- EXPLAIN AFTER index:
EXPLAIN
SELECT
    r.route_id,
    co.city_name AS origin_city,
    cd.city_name AS dest_city,
    SUM(CASE WHEN dl.status = 'delayed' THEN 1 ELSE 0 END) AS delayed_count,
    SUM(CASE WHEN dl.status = 'delivered'
              AND dl.delay_minutes = 0 THEN 1 ELSE 0 END)  AS on_time_count
FROM deliveries dl
JOIN routes r  ON r.route_id  = dl.route_id
JOIN cities co ON co.city_id  = r.origin_city_id
JOIN cities cd ON cd.city_id  = r.dest_city_id
GROUP BY r.route_id, co.city_name, cd.city_name
HAVING delayed_count > on_time_count;

-- Comment:
-- The composite index (route_id, status, delay_minutes) covers all
-- three columns used in QUERY 3's JOIN and conditional aggregation.
-- The optimizer can use this index to look up deliveries by route_id
-- (for the JOIN), and the status + delay_minutes columns are available
-- in the index itself (covering index), reducing disk reads.
