-- ================================================================
-- LogiTrack — Logistics and Delivery Analytics
-- SECTION 7 — TRANSACTIONS (COMMIT example + ROLLBACK example)
-- ================================================================

USE logitrack;

-- ================================================================
-- 7A. COMMIT example
-- Business scenario: atomically create a new shipment AND its
-- delivery. Both rows must be saved together or not at all.
-- ================================================================

START TRANSACTION;

INSERT INTO shipments (client_id, warehouse_id, weight_kg, volume_m3, description, priority)
VALUES (1, 1, 250.00, 3.10, 'Transaction demo shipment', 'high');

SET @new_shipment_id = LAST_INSERT_ID();

INSERT INTO deliveries
    (shipment_id, driver_id, vehicle_id, route_id, warehouse_id,
     status, pickup_date, expected_date, delivery_cost)
VALUES
    (@new_shipment_id, 1, 1, 1, 1,
     'pending', '2026-05-13 09:00:00', '2026-05-14 09:00:00', 45000.00);

COMMIT;

-- After COMMIT, both rows are permanently saved.
-- Verify: this SELECT must return 1 row.
SELECT * FROM shipments WHERE description = 'Transaction demo shipment';


-- ================================================================
-- 7B. ROLLBACK example
-- Business scenario: we start creating a shipment, but before
-- completing the full operation we decide to cancel everything.
-- ROLLBACK undoes all changes made inside the transaction.
-- ================================================================

START TRANSACTION;

-- Step 1: insert a shipment inside the transaction
INSERT INTO shipments (client_id, warehouse_id, weight_kg, volume_m3, description, priority)
VALUES (2, 1, 100.00, 1.20, 'Rollback demo shipment', 'normal');

SET @rollback_shipment_id = LAST_INSERT_ID();

-- Step 2: this SELECT shows the row EXISTS inside the transaction
-- (the row is visible to the current session but not yet committed)
SELECT * FROM shipments WHERE shipment_id = @rollback_shipment_id;

-- Step 3: something went wrong (e.g. delivery creation would fail),
-- so we roll back the entire transaction
ROLLBACK;

-- Step 4: this SELECT returns EMPTY result — the shipment is gone.
-- ROLLBACK undid the INSERT as if it never happened.
SELECT * FROM shipments WHERE shipment_id = @rollback_shipment_id;
