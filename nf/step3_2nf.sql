-- ============================================================
-- 2NF (SECOND NORMAL FORM)
-- LogiTrack — Logistics and Delivery Analytics
--
-- FIXES APPLIED:
-- 1. Removed partial dependencies
-- 2. Separated independent entities into new tables
-- 3. Reduced duplicated driver and warehouse data
--
-- NOTE:
-- Transitive dependencies still exist.
-- Database is NOT yet in 3NF.
-- ============================================================

-- ============================================================
-- DRIVERS TABLE
-- Driver information depends only on driver_id
-- ============================================================
use nf; 
CREATE TABLE Drivers_2NF (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(100),
    driver_phone VARCHAR(30)
);

INSERT INTO Drivers_2NF VALUES
(1, 'Arman Sadykov', '+77771234567'),
(2, 'Dias Nurpeisov', '+77775554433');

-- ============================================================
-- WAREHOUSES TABLE
-- Warehouse information depends only on warehouse_id
-- ============================================================

CREATE TABLE Warehouses_2NF (
    warehouse_id INT PRIMARY KEY,
    warehouse_name VARCHAR(100),
    warehouse_city VARCHAR(100)
);

INSERT INTO Warehouses_2NF VALUES
(1, 'Almaty Central WH', 'Almaty'),
(2, 'Astana North WH', 'Astana'),
(3, 'Shymkent South WH', 'Shymkent');

-- ============================================================
-- DELIVERIES TABLE
-- Delivery information references other entities
-- ============================================================

CREATE TABLE Deliveries_2NF (
    delivery_id INT,
    shipment_id VARCHAR(20),
    driver_id INT,
    warehouse_id INT,
    vehicle_type VARCHAR(50),
    route_city VARCHAR(100),
    delivery_status VARCHAR(50),
    client_name VARCHAR(100),

    PRIMARY KEY (delivery_id, shipment_id),

    FOREIGN KEY (driver_id)
        REFERENCES Drivers_2NF(driver_id),

    FOREIGN KEY (warehouse_id)
        REFERENCES Warehouses_2NF(warehouse_id)
);

INSERT INTO Deliveries_2NF VALUES

(1, 'SHP001', 1, 1,
 'Truck', 'Almaty → Astana',
 'On Time', 'Kaspi Delivery'),

(1, 'SHP002', 1, 2,
 'Van', 'Astana → Karaganda',
 'Delayed', 'DHL Kazakhstan'),

(2, 'SHP003', 2, 3,
 'Truck', 'Shymkent → Taraz',
 'On Time', 'Wildberries'),

(3, 'SHP004', 1, 1,
 'Truck', 'Almaty → Taldykorgan',
 'Failed', 'Ozon Kazakhstan'),

(3, 'SHP005', 1, 1,
 'Sedan', 'Almaty → Astana',
 'On Time', 'Kaspi Delivery'),

(3, 'SHP006', 1, 1,
 'Sedan', 'Almaty → Astana',
 'Delayed', 'Kaspi Delivery');

SELECT 
    del.delivery_id,
    del.shipment_id,
    drv.driver_name,
    drv.driver_phone,
    wh.warehouse_name,
    wh.warehouse_city,
    del.vehicle_type,
    del.route_city,
    del.delivery_status,
    del.client_name
FROM Deliveries_2NF del
INNER JOIN Drivers_2NF drv ON del.driver_id = drv.driver_id
INNER JOIN Warehouses_2NF wh ON del.warehouse_id = wh.warehouse_id
ORDER BY del.delivery_id, del.shipment_id;
-- ============================================================
-- WHY THIS DATABASE IS NOW IN 2NF
-- ============================================================

-- 1. The database is already in 1NF

-- 2. Partial dependencies were removed

-- 3. Driver information is stored only once
--    in Drivers_2NF

-- 4. Warehouse information is stored only once
--    in Warehouses_2NF

-- 5. Deliveries reference drivers and warehouses
--    using foreign keys

-- ============================================================
-- REMAINING PROBLEMS
-- ============================================================

-- Transitive dependencies still exist.

-- Example:
-- warehouse_id → warehouse_city

-- warehouse_city depends on warehouse_id,
-- not directly on the delivery itself.

-- Another example:
-- vehicle_type is still stored repeatedly.

-- Therefore, the database is NOT yet in 3NF.