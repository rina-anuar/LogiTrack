-- ============================================================
-- 0NF (UNNORMALIZED FORM)
-- LogiTrack — Logistics and Delivery Analytics
--
-- Problems:
-- 1. Multiple values inside single columns
-- 2. Repeating groups
-- 3. Driver, warehouse, and route data duplicated
-- 4. Difficult to update and maintain
-- ============================================================
drop database nf;
create database nf;
use nf;
CREATE TABLE DeliveryLog_0NF (
    delivery_id INT,
    shipment_ids VARCHAR(255),
    driver_name VARCHAR(100),
    driver_phone VARCHAR(30),
    warehouse_names VARCHAR(255),
    warehouse_cities VARCHAR(255),
    vehicle_types VARCHAR(255),
    route_cities VARCHAR(255),
    delivery_statuses VARCHAR(255),
    client_names VARCHAR(255)
);

INSERT INTO DeliveryLog_0NF VALUES
(
    1,
    'SHP001, SHP002',
    'Arman Sadykov',
    '+77771234567',
    'Almaty Central WH, Astana North WH',
    'Almaty, Astana',
    'Truck, Van',
    'Almaty → Astana, Astana → Karaganda',
    'On Time, Delayed',
    'Kaspi Delivery, DHL Kazakhstan'
),

(
    2,
    'SHP003',
    'Dias Nurpeisov',
    '+77775554433',
    'Shymkent South WH',
    'Shymkent',
    'Truck',
    'Shymkent → Taraz',
    'On Time',
    'Wildberries'
),

(
    3,
    'SHP004, SHP005, SHP006',
    'Arman Sadykov',
    '+77771234567',
    'Almaty Central WH',
    'Almaty',
    'Truck, Sedan',
    'Almaty → Taldykorgan, Almaty → Astana',
    'Failed, On Time, Delayed',
    'Ozon Kazakhstan, Kaspi Delivery'
);

SELECT 
    delivery_id,
    shipment_ids,
    driver_name,
    driver_phone,
    warehouse_names,
    warehouse_cities,
    vehicle_types,
    route_cities,
    delivery_statuses,
    client_names
FROM DeliveryLog_0NF;
-- ============================================================
-- WHY THIS TABLE IS NOT NORMALIZED
-- ============================================================

-- 1. Multiple shipment IDs stored in one column
--    Example: 'SHP001, SHP002'

-- 2. Multiple warehouse names stored in one column
--    Example: 'Almaty Central WH, Astana North WH'

-- 3. Multiple vehicle types stored in one column
--    Example: 'Truck, Van'

-- 4. Multiple delivery statuses stored in one column
--    Example: 'On Time, Delayed'

-- 5. Driver information is duplicated across rows

-- 6. Warehouse and city information are duplicated

-- 7. Difficult to search, update, and maintain data

-- This structure contains:
-- - repeating groups
-- - multi-valued attributes
-- - redundancy
-- - update anomalies
-- - insertion anomalies
-- - deletion anomalies