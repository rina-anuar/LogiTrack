-- ================================================================
-- LogiTrack — Logistics and Delivery Analytics
-- SECTION 5 — VIEWS
-- ================================================================

USE logitrack;

-- ---------- VIEW 1: driver_performance_view ----------
CREATE OR REPLACE VIEW driver_performance_view AS
SELECT
    d.driver_id,
    CONCAT(d.first_name, ' ', d.last_name)                                       AS driver_name,
    d.rating,
    COUNT(dl.delivery_id)                                                        AS total_deliveries,
    SUM(CASE WHEN dl.status = 'delivered' AND dl.delay_minutes = 0
             THEN 1 ELSE 0 END)                                                  AS on_time_deliveries,
    SUM(CASE WHEN dl.status = 'delayed' THEN 1 ELSE 0 END)                       AS delayed_deliveries,
    SUM(CASE WHEN dl.status = 'failed'  THEN 1 ELSE 0 END)                       AS failed_deliveries,
    ROUND(AVG(dl.delay_minutes), 2)                                              AS avg_delay_minutes
FROM drivers d
LEFT JOIN deliveries dl ON dl.driver_id = d.driver_id
GROUP BY d.driver_id, d.first_name, d.last_name, d.rating;

-- Example use:
SELECT * FROM driver_performance_view ORDER BY on_time_deliveries DESC LIMIT 10;

-- ---------- VIEW 2: warehouse_performance_view ----------
CREATE OR REPLACE VIEW warehouse_performance_view AS
SELECT
    w.warehouse_id,
    w.warehouse_name,
    c.city_name,
    COUNT(dl.delivery_id)                                                                AS total_deliveries,
    ROUND(AVG(dl.delay_minutes), 2)                                                      AS avg_delay_minutes,
    SUM(CASE WHEN dl.status = 'delivered' THEN 1 ELSE 0 END)                             AS delivered_count,
    SUM(CASE WHEN dl.status = 'failed'    THEN 1 ELSE 0 END)                             AS failed_count,
    ROUND(SUM(dl.delivery_cost), 2)                                                      AS total_revenue
FROM warehouses w
JOIN cities c     ON c.city_id      = w.city_id
LEFT JOIN deliveries dl ON dl.warehouse_id = w.warehouse_id
GROUP BY w.warehouse_id, w.warehouse_name, c.city_name;

-- Example use:
SELECT * FROM warehouse_performance_view ORDER BY total_revenue DESC LIMIT 10;


