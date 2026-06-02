
-- LogiTrack — Logistics and Delivery Analytics
-- SECTION 8 — INDEXES AND EXPLAIN ANALYZE (Performance Testing)

USE logitrack;


-- TEST 1: QUERY 6 (Warehouse + Date Range)


SELECT '--- EXPLAIN ANALYZE: BEFORE INDEX (Simulated Table Scan) ---' AS Test_Phase;

-- 1. BEFORE (We force MySQL to ignore the index)
EXPLAIN ANALYZE
SELECT delivery_id, shipment_id, driver_id, status, delay_minutes, actual_date
FROM deliveries IGNORE INDEX (idx_deliveries_wh_pickup)
WHERE warehouse_id = 1
  AND pickup_date >= '2025-09-01'
  AND pickup_date <  '2026-01-01';


SELECT '--- EXPLAIN ANALYZE: AFTER INDEX (Index Lookup) ---' AS Test_Phase;

-- 2. AFTER (We let MySQL use the index naturally)
EXPLAIN ANALYZE
SELECT delivery_id, shipment_id, driver_id, status, delay_minutes, actual_date
FROM deliveries
WHERE warehouse_id = 1
  AND pickup_date >= '2025-09-01'
  AND pickup_date <  '2026-01-01';


-- TEST 2: QUERY 3 (Route + Status conditional aggregation)


SELECT '--- EXPLAIN ANALYZE: BEFORE INDEX 2 (Simulated) ---' AS Test_Phase;

-- 1. BEFORE (We force MySQL to ignore the index)
EXPLAIN ANALYZE
SELECT
    r.route_id,
    co.city_name AS origin_city,
    cd.city_name AS dest_city,
    SUM(CASE WHEN dl.status = 'delayed' THEN 1 ELSE 0 END) AS delayed_count,
    SUM(CASE WHEN dl.status = 'delivered'
              AND dl.delay_minutes = 0 THEN 1 ELSE 0 END)  AS on_time_count
FROM deliveries dl IGNORE INDEX (idx_deliveries_route_status_delay)
JOIN routes r  ON r.route_id  = dl.route_id
JOIN cities co ON co.city_id  = r.origin_city_id
JOIN cities cd ON cd.city_id  = r.dest_city_id
GROUP BY r.route_id, co.city_name, cd.city_name
HAVING delayed_count > on_time_count;


SELECT '--- EXPLAIN ANALYZE: AFTER INDEX 2 ---' AS Test_Phase;

-- 2. AFTER (We let MySQL use the index naturally)
EXPLAIN ANALYZE
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