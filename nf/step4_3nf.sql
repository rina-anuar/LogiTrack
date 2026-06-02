-- ============================================================
-- 3NF (THIRD NORMAL FORM)
-- LogiTrack — Logistics and Delivery Analytics
--
-- FIXES APPLIED:
-- 1. Removed transitive dependencies
-- 2. Separated reference entities
-- 3. Reduced redundancy
-- 4. Improved consistency and scalability
--
-- RESULT:
-- Database is fully normalized up to 3NF.
-- ============================================================

-- ============================================================
-- CITIES TABLE
-- City information stored only once
-- ============================================================
use nf;
CREATE TABLE Cities_3NF (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(100)
);

INSERT INTO Cities_3NF VALUES
(1, 'Almaty'),
(2, 'Astana'),
(3, 'Shymkent'),
(4, 'Karaganda'),
(5, 'Taraz'),
(6, 'Taldykorgan');

-- ============================================================
-- VEHICLE TYPES TABLE
-- Vehicle types stored separately
-- ============================================================

CREATE TABLE VehicleTypes_3NF (
    vehicle_type_id INT PRIMARY KEY,
    vehicle_type_name VARCHAR(50)
);

INSERT INTO VehicleTypes_3NF VALUES
(1, 'Truck'),
(2, 'Van'),
(3, 'Sedan');

-- ============================================================
-- DRIVERS TABLE
-- Driver data stored once
-- ============================================================

CREATE TABLE Drivers_3NF (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(100),
    driver_phone VARCHAR(30)
);

INSERT INTO Drivers_3NF VALUES
(1, 'Arman Sadykov', '+77771234567'),
(2, 'Dias Nurpeisov', '+77775554433');

-- ============================================================
-- WAREHOUSES TABLE
-- Warehouse references city_id
-- ============================================================

CREATE TABLE Warehouses_3NF (
    warehouse_id INT PRIMARY KEY,
    warehouse_name VARCHAR(100),
    city_id INT,

    FOREIGN KEY (city_id)
        REFERENCES Cities_3NF(city_id)
);

INSERT INTO Warehouses_3NF VALUES
(1, 'Almaty Central WH', 1),
(2, 'Astana North WH', 2),
(3, 'Shymkent South WH', 3);

-- ============================================================
-- ROUTES TABLE
-- Route data stored separately
-- ============================================================

CREATE TABLE Routes_3NF (
    route_id INT PRIMARY KEY,
    origin_city_id INT,
    destination_city_id INT,
    distance_km DECIMAL(10,2),

    FOREIGN KEY (origin_city_id)
        REFERENCES Cities_3NF(city_id),

    FOREIGN KEY (destination_city_id)
        REFERENCES Cities_3NF(city_id)
);

INSERT INTO Routes_3NF VALUES
(1, 1, 2, 1200.00),
(2, 2, 4, 200.00),
(3, 3, 5, 180.00),
(4, 1, 6, 300.00);

-- ============================================================
-- CLIENTS TABLE
-- Client data stored separately
-- ============================================================

CREATE TABLE Clients_3NF (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(100)
);

INSERT INTO Clients_3NF VALUES
(1, 'Kaspi Delivery'),
(2, 'DHL Kazakhstan'),
(3, 'Wildberries'),
(4, 'Ozon Kazakhstan');

-- ============================================================
-- DELIVERIES TABLE
-- Main transactional table
-- ============================================================

CREATE TABLE Deliveries_3NF (
    delivery_id INT,
    shipment_id VARCHAR(20),
    driver_id INT,
    warehouse_id INT,
    vehicle_type_id INT,
    route_id INT,
    client_id INT,
    delivery_status VARCHAR(50),

    PRIMARY KEY (delivery_id, shipment_id),

    FOREIGN KEY (driver_id)
        REFERENCES Drivers_3NF(driver_id),

    FOREIGN KEY (warehouse_id)
        REFERENCES Warehouses_3NF(warehouse_id),

    FOREIGN KEY (vehicle_type_id)
        REFERENCES VehicleTypes_3NF(vehicle_type_id),

    FOREIGN KEY (route_id)
        REFERENCES Routes_3NF(route_id),

    FOREIGN KEY (client_id)
        REFERENCES Clients_3NF(client_id)
);

INSERT INTO Deliveries_3NF VALUES

(1, 'SHP001', 1, 1, 1, 1, 1, 'On Time'),

(1, 'SHP002', 1, 2, 2, 2, 2, 'Delayed'),

(2, 'SHP003', 2, 3, 1, 3, 3, 'On Time'),

(3, 'SHP004', 1, 1, 1, 4, 4, 'Failed'),

(3, 'SHP005', 1, 1, 3, 1, 1, 'On Time'),

(3, 'SHP006', 1, 1, 3, 1, 1, 'Delayed');

SELECT 
    d.delivery_id,
    d.shipment_id,
    drv.driver_name,
    drv.driver_phone,
    wh.warehouse_name,
    wh_city.city_name AS warehouse_city,
    vt.vehicle_type_name AS vehicle_type,
    CONCAT(orig_city.city_name, ' → ', dest_city.city_name) AS route,
    r.distance_km,
    cl.client_name,
    d.delivery_status
FROM Deliveries_3NF d
INNER JOIN Drivers_3NF drv ON d.driver_id = drv.driver_id
INNER JOIN Warehouses_3NF wh ON d.warehouse_id = wh.warehouse_id
INNER JOIN Cities_3NF wh_city ON wh.city_id = wh_city.city_id
INNER JOIN VehicleTypes_3NF vt ON d.vehicle_type_id = vt.vehicle_type_id
INNER JOIN Routes_3NF r ON d.route_id = r.route_id
INNER JOIN Cities_3NF orig_city ON r.origin_city_id = orig_city.city_id
INNER JOIN Cities_3NF dest_city ON r.destination_city_id = dest_city.city_id
INNER JOIN Clients_3NF cl ON d.client_id = cl.client_id
ORDER BY d.delivery_id, d.shipment_id;
-- ============================================================
-- WHY THIS DATABASE IS NOW IN 3NF
-- ============================================================

-- 1. The database is already in 2NF

-- 2. Transitive dependencies were removed

-- Example:
-- warehouse_id → city_id → city_name

-- City information is now stored separately
-- in Cities_3NF

-- Example:
-- delivery_id → vehicle_type_id → vehicle_type_name

-- Vehicle types are stored separately
-- in VehicleTypes_3NF

-- Example:
-- delivery_id → route_id → distance_km

-- Route information is stored separately
-- in Routes_3NF

-- ============================================================
-- FINAL RESULT
-- ============================================================

-- 1. Redundancy minimized
-- 2. Data consistency improved
-- 3. Easier maintenance
-- 4. Better scalability
-- 5. Reduced update anomalies
-- 6. Reduced insertion anomalies
-- 7. Reduced deletion anomalies

-- The database is fully normalized up to Third Normal Form (3NF).