-- ================================================================
-- LogiTrack — Logistics and Delivery Analytics
-- SECTION 2 — CREATE DATABASE + CREATE TABLE STATEMENTS
-- 10 tables, 16 foreign-key relationships, 3NF, full constraints
-- ================================================================

DROP DATABASE IF EXISTS logitrack;
CREATE DATABASE logitrack
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
USE logitrack;

-- 1. cities 
CREATE TABLE cities (
    city_id     INT AUTO_INCREMENT PRIMARY KEY,
    city_name   VARCHAR(100) NOT NULL,
    region      VARCHAR(100) NOT NULL,
    country     VARCHAR(100) NOT NULL DEFAULT 'Kazakhstan',
    population  INT NOT NULL,
    CONSTRAINT uq_city UNIQUE (city_name, country),
    CONSTRAINT chk_city_population CHECK (population > 0)
) ENGINE=InnoDB;

-- 2. warehouses 
CREATE TABLE warehouses (
    warehouse_id   INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(150) NOT NULL UNIQUE,
    city_id        INT NOT NULL,
    address        VARCHAR(255) NOT NULL,
    capacity_kg    INT NOT NULL,
    opened_date    DATE NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT fk_wh_city FOREIGN KEY (city_id) REFERENCES cities(city_id),
    CONSTRAINT chk_wh_capacity CHECK (capacity_kg > 0)
) ENGINE=InnoDB;

--  3. vehicle_types
CREATE TABLE vehicle_types (
    type_id       INT AUTO_INCREMENT PRIMARY KEY,
    type_name     VARCHAR(50) NOT NULL UNIQUE,
    max_weight_kg DECIMAL(10,2) NOT NULL,
    max_volume_m3 DECIMAL(10,2) NOT NULL,
    CONSTRAINT chk_vt_weight CHECK (max_weight_kg > 0),
    CONSTRAINT chk_vt_volume CHECK (max_volume_m3 > 0)
) ENGINE=InnoDB;

--4. vehicles 
CREATE TABLE vehicles (
    vehicle_id    INT AUTO_INCREMENT PRIMARY KEY,
    plate_number  VARCHAR(20) NOT NULL UNIQUE,
    type_id       INT NOT NULL,
    warehouse_id  INT NOT NULL,
    year_produced INT NOT NULL,
    is_active     BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_v_type FOREIGN KEY (type_id) REFERENCES vehicle_types(type_id),
    CONSTRAINT fk_v_wh   FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    CONSTRAINT chk_v_year CHECK (year_produced BETWEEN 1990 AND 2026)
) ENGINE=InnoDB;

--  5. drivers 
CREATE TABLE drivers (
    driver_id      INT AUTO_INCREMENT PRIMARY KEY,
    first_name     VARCHAR(50) NOT NULL,
    last_name      VARCHAR(50) NOT NULL,
    phone          VARCHAR(20) NOT NULL UNIQUE,
    license_number VARCHAR(30) NOT NULL UNIQUE,
    hire_date      DATE NOT NULL DEFAULT (CURRENT_DATE),
    warehouse_id   INT NOT NULL,
    city_id        INT NOT NULL,
    rating         DECIMAL(3,2) NOT NULL DEFAULT 5.00,
    CONSTRAINT fk_d_wh   FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    CONSTRAINT fk_d_city FOREIGN KEY (city_id)     REFERENCES cities(city_id),
    CONSTRAINT chk_d_rating CHECK (rating BETWEEN 1.00 AND 5.00)
) ENGINE=InnoDB;

-- 6. clients 
CREATE TABLE clients (
    client_id      INT AUTO_INCREMENT PRIMARY KEY,
    company_name   VARCHAR(200) NOT NULL,
    contact_person VARCHAR(100),
    email          VARCHAR(150) NOT NULL UNIQUE,
    phone          VARCHAR(20),
    city_id        INT NOT NULL,
    registered_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_c_city FOREIGN KEY (city_id) REFERENCES cities(city_id)
) ENGINE=InnoDB;

-- 7. routes 
CREATE TABLE routes (
    route_id           INT AUTO_INCREMENT PRIMARY KEY,
    origin_city_id     INT NOT NULL,
    dest_city_id       INT NOT NULL,
    distance_km        DECIMAL(10,2) NOT NULL,
    est_duration_hours DECIMAL(6,2) NOT NULL,
    CONSTRAINT uq_route UNIQUE (origin_city_id, dest_city_id),
    CONSTRAINT fk_r_origin FOREIGN KEY (origin_city_id) REFERENCES cities(city_id),
    CONSTRAINT fk_r_dest   FOREIGN KEY (dest_city_id)   REFERENCES cities(city_id),
    CONSTRAINT chk_r_distance CHECK (distance_km > 0),
    CONSTRAINT chk_r_duration CHECK (est_duration_hours > 0),
    CONSTRAINT chk_r_different CHECK (origin_city_id <> dest_city_id)
) ENGINE=InnoDB;

--  8. shipments 
CREATE TABLE shipments (
    shipment_id  INT AUTO_INCREMENT PRIMARY KEY,
    client_id    INT NOT NULL,
    warehouse_id INT NOT NULL,
    weight_kg    DECIMAL(10,2) NOT NULL,
    volume_m3    DECIMAL(10,2) NOT NULL,
    description  VARCHAR(255),
    created_at   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    priority     VARCHAR(10) NOT NULL DEFAULT 'normal',
    CONSTRAINT fk_s_client FOREIGN KEY (client_id)    REFERENCES clients(client_id),
    CONSTRAINT fk_s_wh     FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    CONSTRAINT chk_s_weight CHECK (weight_kg > 0),
    CONSTRAINT chk_s_volume CHECK (volume_m3 > 0),
    CONSTRAINT chk_s_priority CHECK (priority IN ('low','normal','high','urgent'))
) ENGINE=InnoDB;

-- 9. deliveries
CREATE TABLE deliveries (
    delivery_id    INT AUTO_INCREMENT PRIMARY KEY,
    shipment_id    INT NOT NULL,
    driver_id      INT NOT NULL,
    vehicle_id     INT NOT NULL,
    route_id       INT NOT NULL,
    warehouse_id   INT NOT NULL,
    status         VARCHAR(20) NOT NULL DEFAULT 'pending',
    pickup_date    DATETIME NOT NULL,
    expected_date  DATETIME NOT NULL,
    actual_date    DATETIME NULL,
    delay_minutes  INT NOT NULL DEFAULT 0,
    delivery_cost  DECIMAL(12,2) NOT NULL,
    CONSTRAINT uq_delivery_shipment UNIQUE (shipment_id),
    CONSTRAINT fk_dl_shipment FOREIGN KEY (shipment_id) REFERENCES shipments(shipment_id),
    CONSTRAINT fk_dl_driver   FOREIGN KEY (driver_id)   REFERENCES drivers(driver_id),
    CONSTRAINT fk_dl_vehicle  FOREIGN KEY (vehicle_id)  REFERENCES vehicles(vehicle_id),
    CONSTRAINT fk_dl_route    FOREIGN KEY (route_id)    REFERENCES routes(route_id),
    CONSTRAINT fk_dl_wh       FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    CONSTRAINT chk_dl_status CHECK (status IN
        ('pending','in_transit','delivered','delayed','failed')),
    CONSTRAINT chk_dl_dates  CHECK (expected_date > pickup_date),
    CONSTRAINT chk_dl_actual_date CHECK (actual_date IS NULL OR actual_date >= pickup_date),
    CONSTRAINT chk_dl_delay  CHECK (delay_minutes >= 0),
    CONSTRAINT chk_dl_cost   CHECK (delivery_cost > 0)
) ENGINE=InnoDB;

--  10. delivery_status_log (audit) 
CREATE TABLE delivery_status_log (
    log_id      INT AUTO_INCREMENT PRIMARY KEY,
    delivery_id INT NOT NULL,
    old_status  VARCHAR(20),
    new_status  VARCHAR(20) NOT NULL,
    changed_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    changed_by  VARCHAR(50) NOT NULL DEFAULT 'system',
    CONSTRAINT fk_dsl_delivery FOREIGN KEY (delivery_id)
        REFERENCES deliveries(delivery_id)
) ENGINE=InnoDB;
