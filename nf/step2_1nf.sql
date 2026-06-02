-- ============================================================
-- 1NF (FIRST NORMAL FORM)
-- LogiTrack — Logistics and Delivery Analytics
--
-- FIXES APPLIED:
-- 1. Removed repeating groups
-- 2. Removed multi-valued attributes
-- 3. Every cell now contains atomic values
--
-- NOTE:
-- Driver and warehouse data are still duplicated.
-- Partial dependencies still exist.
-- ============================================================
use nf;
CREATE TABLE DeliveryLog_1NF (
    delivery_id INT,
    shipment_id VARCHAR(20),
    driver_name VARCHAR(100),
    driver_phone VARCHAR(30),
    warehouse_name VARCHAR(100),
    warehouse_city VARCHAR(100),
    vehicle_type VARCHAR(50),
    route_city VARCHAR(100),
    delivery_status VARCHAR(50),
    client_name VARCHAR(100)
);

INSERT INTO DeliveryLog_1NF VALUES

-- Delivery 1
(1, 'SHP001', 'Arman Sadykov', '+77771234567',
 'Almaty Central WH', 'Almaty',
 'Truck', 'Almaty → Astana',
 'On Time', 'Kaspi Delivery'),

(1, 'SHP002', 'Arman Sadykov', '+77771234567',
 'Astana North WH', 'Astana',
 'Van', 'Astana → Karaganda',
 'Delayed', 'DHL Kazakhstan'),

-- Delivery 2
(2, 'SHP003', 'Dias Nurpeisov', '+77775554433',
 'Shymkent South WH', 'Shymkent',
 'Truck', 'Shymkent → Taraz',
 'On Time', 'Wildberries'),

-- Delivery 3
(3, 'SHP004', 'Arman Sadykov', '+77771234567',
 'Almaty Central WH', 'Almaty',
 'Truck', 'Almaty → Taldykorgan',
 'Failed', 'Ozon Kazakhstan'),

(3, 'SHP005', 'Arman Sadykov', '+77771234567',
 'Almaty Central WH', 'Almaty',
 'Sedan', 'Almaty → Astana',
 'On Time', 'Kaspi Delivery'),

(3, 'SHP006', 'Arman Sadykov', '+77771234567',
 'Almaty Central WH', 'Almaty',
 'Sedan', 'Almaty → Astana',
 'Delayed', 'Kaspi Delivery');

SELECT 
    delivery_id,
    shipment_id,
    driver_name,
    driver_phone,
    warehouse_name,
    warehouse_city,
    vehicle_type,
    route_city,
    delivery_status,
    client_name
FROM DeliveryLog_1NF;
-- ============================================================
-- WHY THIS TABLE IS NOW IN 1NF
-- ============================================================

-- 1. Every attribute contains atomic values
--    Example:
--    shipment_id = 'SHP001'
--    NOT 'SHP001, SHP002'

-- 2. Repeating groups were removed

-- 3. Each shipment is stored in a separate row

-- ============================================================
-- REMAINING PROBLEMS
-- ============================================================

-- 1. Driver information is still duplicated
--    'Arman Sadykov' appears many times

-- 2. Warehouse information is duplicated
--    'Almaty Central WH' appears many times

-- 3. Vehicle type information is duplicated

-- 4. Partial dependencies still exist

-- Example:
-- driver_phone depends only on driver_name
-- not on the whole delivery record

-- Therefore, the database is NOT yet in 2NF.