
-- LogiTrack — Logistics and Delivery Analytics
-- SECTION 6 — TRIGGER
-- After UPDATE on deliveries.status -> write audit log entry.
-- Useful: keeps a full history of state transitions for any
-- delivery, supports SLA disputes and operational analytics.


USE logitrack;


DELIMITER //
CREATE TRIGGER trg_delivery_status_audit
AFTER UPDATE ON deliveries
FOR EACH ROW
BEGIN
    IF OLD.status <> NEW.status THEN
        INSERT INTO delivery_status_log (delivery_id, old_status, new_status, changed_by)
        VALUES (NEW.delivery_id, OLD.status, NEW.status, CURRENT_USER());
    END IF;
END//
DELIMITER ;

-- Trigger demo:
UPDATE deliveries SET status = 'in_transit' WHERE delivery_id = 1;
UPDATE deliveries SET status = 'delivered'  WHERE delivery_id = 1;
SELECT * FROM delivery_status_log WHERE delivery_id = 1;


