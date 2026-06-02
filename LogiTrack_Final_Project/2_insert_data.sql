-- ================================================================
-- LogiTrack — Logistics and Delivery Analytics
-- SECTION 3 — INSERT INTO STATEMENTS
-- Reference tables: rich data; Transactional: 300+ rows
-- ================================================================

USE logitrack;


--  1. cities (60 rows) 
INSERT INTO cities (city_name, region, country, population) VALUES
('Almaty','Almaty','Kazakhstan',2000000),
('Astana','Astana','Kazakhstan',1200000),
('Shymkent','Turkestan','Kazakhstan',1050000),
('Karaganda','Karaganda','Kazakhstan',500000),
('Aktobe','Aktobe','Kazakhstan',420000),
('Taraz','Jambyl','Kazakhstan',360000),
('Pavlodar','Pavlodar','Kazakhstan',340000),
('Ust-Kamenogorsk','East Kazakhstan','Kazakhstan',330000),
('Semey','Abai','Kazakhstan',320000),
('Atyrau','Atyrau','Kazakhstan',280000),
('Kostanay','Kostanay','Kazakhstan',240000),
('Petropavlovsk','North Kazakhstan','Kazakhstan',220000),
('Oral','West Kazakhstan','Kazakhstan',210000),
('Aktau','Mangystau','Kazakhstan',190000),
('Taldykorgan','Jetisu','Kazakhstan',145000),
('Kokshetau','Akmola','Kazakhstan',140000),
('Turkistan','Turkestan','Kazakhstan',160000),
('Ekibastuz','Pavlodar','Kazakhstan',130000),
('Rudny','Kostanay','Kazakhstan',120000),
('Temirtau','Karaganda','Kazakhstan',170000),
('Zhanaozen','Mangystau','Kazakhstan',100000),
('Balkhash','Karaganda','Kazakhstan',75000),
('Kentau','Turkestan','Kazakhstan',65000),
('Ridder','East Kazakhstan','Kazakhstan',50000),
('Saran','Karaganda','Kazakhstan',52000),
('Stepnogorsk','Akmola','Kazakhstan',44000),
('Lisakovsk','Kostanay','Kazakhstan',35000),
('Shakhtinsk','Karaganda','Kazakhstan',38000),
('Arkalyk','Kostanay','Kazakhstan',28000),
('Zhezkazgan','Ulytau','Kazakhstan',90000),
('Moscow','Moscow','Russia',12700000),
('Bishkek','Chuy','Kyrgyzstan',1100000),
('Tashkent','Tashkent','Uzbekistan',2900000),
('Novosibirsk','Novosibirsk','Russia',1600000),
('Omsk','Omsk','Russia',1150000),
('Dushanbe','Dushanbe','Tajikistan',850000),
('Samarkand','Samarkand','Uzbekistan',550000),
('Karakol','Issyk-Kul','Kyrgyzstan',80000),
('Osh','Osh','Kyrgyzstan',300000),
('Bukhara','Bukhara','Uzbekistan',280000),
('Barnaul','Altai Krai','Russia',630000),
('Orenburg','Orenburg','Russia',560000),
('Chelyabinsk','Chelyabinsk','Russia',1190000),
('Yekaterinburg','Sverdlovsk','Russia',1500000),
('Ufa','Bashkortostan','Russia',1100000),
('Tomsk','Tomsk','Russia',570000),
('Krasnoyarsk','Krasnoyarsk','Russia',1100000),
('Irkutsk','Irkutsk','Russia',620000),
('Samara','Samara','Russia',1160000),
('Kazan','Tatarstan','Russia',1260000),
('Khorgos','Jetisu','Kazakhstan',10000),
('Dostyk','Almaty','Kazakhstan',8000),
('Beineu','Mangystau','Kazakhstan',15000),
('Shu','Jambyl','Kazakhstan',40000),
('Aralsk','Kyzylorda','Kazakhstan',30000),
('Kyzylorda','Kyzylorda','Kazakhstan',230000),
('Kapchagay','Almaty','Kazakhstan',55000),
('Saryagash','Turkestan','Kazakhstan',45000),
('Zhetisay','Turkestan','Kazakhstan',35000),
('Kandyagash','Aktobe','Kazakhstan',28000);

--  2. warehouses (50 rows) 
INSERT INTO warehouses (warehouse_name, city_id, address, capacity_kg, opened_date) VALUES
('Almaty Central Hub',1,'Tole Bi St 59',5000,'2018-03-15'),
('Almaty South Depot',1,'Raiymbek Ave 221',3000,'2020-06-01'),
('Astana Main Warehouse',2,'Kabanbay Batyr Ave 11',4500,'2017-09-10'),
('Astana East Depot',2,'Turan Ave 55',2500,'2021-01-20'),
('Shymkent Logistics Center',3,'Tauke Khan Ave 88',3500,'2019-04-25'),
('Karaganda Depot',4,'Bukhar Zhyrau St 14',2000,'2019-08-12'),
('Aktobe Warehouse',5,'Abilkayyr Khan Ave 67',2200,'2020-02-18'),
('Taraz Storage',6,'Tole Bi St 33',1500,'2020-11-05'),
('Pavlodar Depot',7,'Kataev St 19',1800,'2021-03-22'),
('Ust-Kamenogorsk Hub',8,'Abay St 72',2000,'2019-07-14'),
('Semey Warehouse',9,'Abay St 100',1700,'2020-09-30'),
('Atyrau Oil Depot',10,'Satpayev Ave 12',2800,'2018-12-01'),
('Kostanay Agro Hub',11,'Al-Farabi St 44',2100,'2021-05-10'),
('Petropavlovsk Depot',12,'Internatsionalnaya St 8',1600,'2020-07-15'),
('Oral West Hub',13,'Dostyk St 27',1900,'2019-11-22'),
('Aktau Port Warehouse',14,'Port Zone 5',3200,'2018-06-08'),
('Taldykorgan Depot',15,'Kabanbay Batyr St 3',1200,'2021-08-14'),
('Kokshetau Storage',16,'Abay St 55',1400,'2022-01-10'),
('Turkistan Depot',17,'International St 10',1500,'2022-04-20'),
('Ekibastuz Power Hub',18,'Energetik St 7',1000,'2021-11-03'),
('Rudny Metal Depot',19,'Gornyakov St 15',1100,'2022-06-15'),
('Temirtau Steel Hub',20,'Metallurgov St 22',1800,'2019-10-01'),
('Zhanaozen Oil Depot',21,'Neft St 9',1300,'2020-05-25'),
('Balkhash Copper Hub',22,'Lenina St 45',900,'2021-02-14'),
('Kentau Depot',23,'Gagarin St 11',800,'2022-03-18'),
('Ridder Mining Hub',24,'Semipalatinsk St 6',700,'2021-09-09'),
('Saran Depot',25,'Tsentral St 8',600,'2022-07-22'),
('Zhezkazgan Hub',30,'Alashahana St 17',1100,'2020-04-11'),
('Kyzylorda Depot',56,'Aiteke Bi St 28',1400,'2021-06-30'),
('Bishkek Partner Hub',32,'Manas Ave 105',2000,'2020-08-19'),
('Tashkent International Depot',33,'Amir Temur Ave 200',3000,'2019-05-12'),
('Novosibirsk Transit Hub',34,'Krasny Prospekt 77',2500,'2019-02-28'),
('Omsk Depot',35,'Lenina Ave 50',1800,'2021-04-15'),
('Khorgos FTZ Warehouse',51,'FTZ Block A3',4000,'2018-10-10'),
('Moscow Partner Depot',31,'Leningradsky Ave 33',3500,'2020-01-05'),
('Almaty Airport Cargo',1,'Airport Zone B2',2200,'2019-12-20'),
('Astana Airport Cargo',2,'Airport Industrial Zone',2000,'2020-03-14'),
('Shymkent North Depot',3,'Industrial Zone 5',1500,'2022-02-08'),
('Atyrau Transit Hub',10,'Azattyk Ave 88',2400,'2021-10-18'),
('Kapchagay Depot',57,'Industrial Park 12',1000,'2022-05-05'),
('Saryagash Border Hub',58,'Border Zone 1',1800,'2020-12-12'),
('Dostyk Rail Depot',52,'Railway Station 3',2600,'2019-01-15'),
('Beineu Transit',53,'Transit Zone 2',900,'2021-07-07'),
('Shu Junction Depot',54,'Railway St 14',800,'2022-08-20'),
('Aralsk Depot',55,'Koktobe St 5',600,'2023-01-15'),
('Kandyagash Transit',60,'Vokzal St 11',700,'2022-09-10'),
('Almaty Tech Park Hub',1,'Al-Farabi Ave 77B',1500,'2023-03-01'),
('Astana Expo Depot',2,'Expo Zone C4',1200,'2023-05-20'),
('Samarkand Partner Depot',37,'Registan St 55',1000,'2022-11-01'),
('Kazan Transit Hub',50,'Tatarstan Ave 22',1600,'2021-12-05');

--  3. vehicle_types (6 rows) 
INSERT INTO vehicle_types (type_name, max_weight_kg, max_volume_m3) VALUES
('Motorcycle Courier',50.00,0.20),
('Small Van',800.00,4.00),
('Medium Truck',3500.00,18.00),
('Large Truck',10000.00,45.00),
('Refrigerated Truck',8000.00,35.00),
('Heavy Freight',20000.00,80.00);

--  4. vehicles (80 rows) 
INSERT INTO vehicles (plate_number, type_id, warehouse_id, year_produced, is_active) VALUES
('01A001AA',2,1,2020,TRUE),('01A002AB',3,1,2019,TRUE),
('01A003AC',4,1,2021,TRUE),('01A004AD',5,1,2022,TRUE),
('01A005AE',6,2,2020,TRUE),('01A006AF',2,2,2021,TRUE),
('01A007AG',3,2,2019,FALSE),('01A008AH',1,1,2023,TRUE),
('02B001AA',3,3,2020,TRUE),('02B002AB',4,3,2021,TRUE),
('02B003AC',2,3,2019,TRUE),('02B004AD',6,4,2022,TRUE),
('02B005AE',5,4,2020,TRUE),('02B006AF',3,4,2021,TRUE),
('10C001AA',3,5,2019,TRUE),('10C002AB',4,5,2020,TRUE),
('10C003AC',2,5,2022,TRUE),('10C004AD',5,5,2021,TRUE),
('09D001AA',3,6,2020,TRUE),('09D002AB',4,6,2019,TRUE),
('04E001AA',3,7,2021,TRUE),('04E002AB',2,7,2020,TRUE),
('08F001AA',3,8,2022,TRUE),('08F002AB',4,8,2019,TRUE),
('14G001AA',3,9,2020,TRUE),('14G002AB',2,9,2021,TRUE),
('16H001AA',4,10,2019,TRUE),('16H002AB',3,10,2020,TRUE),
('16H003AC',2,10,2022,TRUE),('18I001AA',3,11,2021,TRUE),
('06J001AA',3,12,2020,TRUE),('06J002AB',4,12,2019,TRUE),
('15K001AA',3,13,2022,TRUE),('15K002AB',2,13,2020,TRUE),
('12L001AA',3,14,2021,TRUE),('12L002AB',4,14,2019,TRUE),
('13M001AA',3,15,2020,TRUE),('13M002AB',2,15,2022,TRUE),
('17N001AA',4,16,2021,TRUE),('17N002AB',3,16,2019,TRUE),
('07O001AA',3,17,2020,TRUE),('07O002AB',2,17,2022,TRUE),
('11P001AA',3,18,2021,TRUE),('11P002AB',4,18,2019,FALSE),
('62Q001AA',6,34,2020,TRUE),('62Q002AB',4,34,2021,TRUE),
('63R001AA',3,31,2022,TRUE),('63R002AB',4,31,2019,TRUE),
('01A009AI',2,36,2023,TRUE),('01A010AJ',3,36,2022,TRUE),
('02B007AG',2,37,2023,TRUE),('02B008AH',3,37,2022,TRUE),
('10C005AE',4,38,2021,TRUE),('10C006AF',2,38,2023,TRUE),
('06J003AC',6,39,2020,TRUE),('06J004AD',3,39,2021,TRUE),
('01A011AK',1,40,2023,TRUE),('01A012AL',2,40,2022,TRUE),
('10C007AG',3,41,2020,TRUE),('10C008AH',6,42,2021,TRUE),
('19S001AA',4,43,2022,TRUE),('19S002AB',3,43,2020,TRUE),
('20T001AA',3,44,2021,TRUE),('20T002AB',2,44,2023,TRUE),
('21U001AA',6,45,2019,TRUE),('21U002AB',3,45,2022,FALSE),
('22V001AA',3,46,2021,TRUE),('22V002AB',2,46,2023,TRUE),
('01A013AM',4,47,2022,TRUE),('01A014AN',2,47,2023,TRUE),
('02B009AI',3,48,2022,TRUE),('02B010AJ',2,48,2023,TRUE),
('64W001AA',3,49,2021,TRUE),('64W002AB',4,49,2020,TRUE),
('65X001AA',3,50,2022,TRUE),('65X002AB',2,50,2023,TRUE),
('01A015AO',5,1,2022,TRUE),('01A016AP',3,2,2023,TRUE),
('02B011AK',4,3,2022,TRUE),('02B012AL',5,4,2023,TRUE);

--  5. drivers (70 rows) 
INSERT INTO drivers (first_name, last_name, phone, license_number, hire_date, warehouse_id, city_id, rating) VALUES
('Aibek','Nursultanov','+77001110001','KZ-DL-000001','2019-02-10',1,1,4.85),
('Daulet','Kairatov','+77001110002','KZ-DL-000002','2020-05-15',1,1,4.72),
('Erlan','Smagulev','+77001110003','KZ-DL-000003','2018-11-20',2,1,4.90),
('Marat','Tulegenov','+77001110004','KZ-DL-000004','2021-01-08',2,1,4.55),
('Nurzhan','Abdykaimov','+77001110005','KZ-DL-000005','2019-07-25',3,2,4.80),
('Bakyt','Seitkazy','+77001110006','KZ-DL-000006','2020-03-12',3,2,4.65),
('Ruslan','Omarov','+77001110007','KZ-DL-000007','2021-06-01',4,2,4.40),
('Serik','Bektasov','+77001110008','KZ-DL-000008','2019-09-18',5,3,4.78),
('Talgat','Kasenov','+77001110009','KZ-DL-000009','2020-12-05',5,3,4.60),
('Zhenis','Muratov','+77001110010','KZ-DL-000010','2018-04-22',6,4,4.92),
('Arman','Zhakypov','+77001110011','KZ-DL-000011','2020-08-14',7,5,4.50),
('Bolat','Nurpeisov','+77001110012','KZ-DL-000012','2021-02-28',8,6,4.45),
('Galym','Ospanov','+77001110013','KZ-DL-000013','2019-10-10',9,7,4.70),
('Darkhan','Baimuratov','+77001110014','KZ-DL-000014','2020-06-20',10,8,4.88),
('Eldar','Satybaldiev','+77001110015','KZ-DL-000015','2021-04-03',11,9,4.35),
('Farid','Kenzhebaev','+77001110016','KZ-DL-000016','2019-12-15',12,10,4.95),
('Askar','Duisekov','+77001110017','KZ-DL-000017','2020-09-08',13,11,4.62),
('Kanat','Sagnaev','+77001110018','KZ-DL-000018','2021-07-12',14,12,4.48),
('Timur','Akhmetov','+77001110019','KZ-DL-000019','2019-05-30',15,13,4.75),
('Yerbol','Sultanov','+77001110020','KZ-DL-000020','2020-11-18',16,14,4.82),
('Azamat','Mukanov','+77001110021','KZ-DL-000021','2021-03-05',17,15,4.30),
('Daniyar','Kaliyev','+77001110022','KZ-DL-000022','2020-01-22',18,16,4.68),
('Islambek','Nurmagambetov','+77001110023','KZ-DL-000023','2019-08-09',19,17,4.55),
('Kairat','Zhumabekov','+77001110024','KZ-DL-000024','2021-09-15',20,18,4.42),
('Mukhtar','Abylkasymov','+77001110025','KZ-DL-000025','2020-04-11',21,19,4.73),
('Nurlan','Tokpanov','+77001110026','KZ-DL-000026','2019-06-28',22,20,4.88),
('Samat','Berkinbaev','+77001110027','KZ-DL-000027','2021-11-20',1,1,4.58),
('Temirlan','Dzhunusov','+77001110028','KZ-DL-000028','2020-02-14',3,2,4.76),
('Ulanbek','Kadyrov','+77001110029','KZ-DL-000029','2019-03-07',5,3,4.90),
('Adil','Ryskulov','+77001110030','KZ-DL-000030','2021-08-22',6,4,4.44),
('Bekzat','Tursunov','+77001110031','KZ-DL-000031','2020-07-16',7,5,4.67),
('Dias','Mazhitov','+77001110032','KZ-DL-000032','2019-11-11',12,10,4.81),
('Erzhan','Abdinov','+77001110033','KZ-DL-000033','2021-05-29',34,51,4.53),
('Gaziz','Baigabylov','+77001110034','KZ-DL-000034','2020-10-03',34,51,4.70),
('Zhanat','Issenov','+77001110035','KZ-DL-000035','2019-01-19',31,33,4.86),
('Askhat','Seydalin','+77001110036','KZ-DL-000036','2021-12-08',31,33,4.40),
('Bagdat','Nurgaliyev','+77001110037','KZ-DL-000037','2020-06-25',36,1,4.74),
('Doszhan','Imashev','+77001110038','KZ-DL-000038','2019-04-14',37,2,4.60),
('Erik','Kozhakhmetov','+77001110039','KZ-DL-000039','2021-10-01',38,3,4.49),
('Zhanibek','Tastanbekov','+77001110040','KZ-DL-000040','2020-08-19',39,10,4.83),
('Alikhan','Dosymbekov','+77001110041','KZ-DL-000041','2019-09-05',40,57,4.55),
('Baurzhan','Nysanbaev','+77001110042','KZ-DL-000042','2021-02-11',41,58,4.71),
('Dinmukhamed','Suleimenov','+77001110043','KZ-DL-000043','2020-05-08',42,52,4.47),
('Ermek','Abenov','+77001110044','KZ-DL-000044','2019-07-21',43,53,4.62),
('Zholdas','Kudaibergenov','+77001110045','KZ-DL-000045','2021-04-17',44,54,4.38),
('Kuanysh','Baizhanov','+77001110046','KZ-DL-000046','2020-01-30',45,55,4.79),
('Madi','Nurzhanov','+77001110047','KZ-DL-000047','2019-10-25',46,60,4.56),
('Olzhas','Meiramov','+77001110048','KZ-DL-000048','2021-06-13',47,1,4.84),
('Rakhat','Askarov','+77001110049','KZ-DL-000049','2020-03-28',48,2,4.41),
('Sanzhar','Bekturov','+77001110050','KZ-DL-000050','2019-12-07',49,37,4.77),
('Zhandos','Kenzhegaliyev','+77001110051','KZ-DL-000051','2020-11-14',50,50,4.63),
('Almas','Tursynov','+77001110052','KZ-DL-000052','2021-01-25',1,1,4.50),
('Berikbol','Yessimov','+77001110053','KZ-DL-000053','2020-09-19',2,1,4.69),
('Dauren','Shaimerdenov','+77001110054','KZ-DL-000054','2019-06-11',3,2,4.87),
('Ersain','Taipov','+77001110055','KZ-DL-000055','2021-08-04',5,3,4.43),
('Zhassulan','Aldabergenov','+77001110056','KZ-DL-000056','2020-04-27',6,4,4.76),
('Kazbek','Toktarov','+77001110057','KZ-DL-000057','2019-02-16',7,5,4.91),
('Maksut','Zhumagulov','+77001110058','KZ-DL-000058','2021-07-09',10,8,4.54),
('Orynbasar','Moldabekov','+77001110059','KZ-DL-000059','2020-12-22',11,9,4.66),
('Rinat','Serikbaev','+77001110060','KZ-DL-000060','2019-05-03',12,10,4.80),
('Sultan','Amangeldy','+77001110061','KZ-DL-000061','2021-03-18',13,11,4.37),
('Ulan','Moldakhmetov','+77001110062','KZ-DL-000062','2020-10-09',14,12,4.72),
('Anuar','Sharipov','+77001110063','KZ-DL-000063','2019-08-26',15,13,4.58),
('Bakhyt','Kenbaev','+77001110064','KZ-DL-000064','2021-11-05',16,14,4.83),
('Dosbol','Myrzakhmetov','+77001110065','KZ-DL-000065','2020-07-01',17,15,4.46),
('Yernar','Tazhibaev','+77001110066','KZ-DL-000066','2019-03-13',18,16,4.74),
('Zhanseit','Kozhamuratov','+77001110067','KZ-DL-000067','2021-10-20',22,20,4.59),
('Kurmet','Batyrbekov','+77001110068','KZ-DL-000068','2020-02-05',28,30,4.85),
('Miras','Tugelbaev','+77001110069','KZ-DL-000069','2019-11-28',29,56,4.42),
('Oral','Dauletbaev','+77001110070','KZ-DL-000070','2021-05-16',30,32,4.68);

--  6. clients (80 rows) 
INSERT INTO clients (company_name, contact_person, email, phone, city_id) VALUES
('TechnoMart KZ','Aidar Baev','info@technomart.kz','+77012220001',1),
('Sulpak','Murat Isaev','logistics@sulpak.kz','+77012220002',1),
('Magnum Cash and Carry','Elena Kim','supply@magnum.kz','+77012220003',2),
('Kaspi Shop','Artur Pak','delivery@kaspi.kz','+77012220004',1),
('Mechta Electronics','Daniyar Shek','orders@mechta.kz','+77012220005',3),
('Arbuz Online','Olga Petrova','ops@arbuz.kz','+77012220006',1),
('Wildberries KZ','Natalia Ivanova','wh@wildberries.kz','+77012220007',2),
('Ozon KZ','Roman Fedorov','fulfillment@ozon.kz','+77012220008',1),
('Halyk Market','Serik Alimov','trade@halykmarket.kz','+77012220009',2),
('SmartLife Store','Asel Nurmanova','info@smartlife.kz','+77012220010',3),
('BauMarket','Igor Volkov','procurement@baumarket.kz','+77012220011',4),
('Alser Electronics','Timur Sagnaev','logistics@alser.kz','+77012220012',1),
('Grand Pharma','Gulnaz Tursynova','supply@grandpharma.kz','+77012220013',2),
('FoodCity Distribution','Kairat Beisembaev','dist@foodcity.kz','+77012220014',5),
('KazAgro Supply','Meiram Ospanov','agro@kazagro.kz','+77012220015',11),
('Tengri Textile','Ainur Kaliyeva','export@tengritextile.kz','+77012220016',3),
('Steel KZ Industries','Bolat Akhmetov','orders@steelkz.kz','+77012220017',20),
('PetroKaz Supplies','Nurlan Kenzhegaliyev','supply@petrokaz.kz','+77012220018',10),
('Nomad Furniture','Zhanna Mukanova','sales@nomadfurniture.kz','+77012220019',1),
('ConstructPro','Andrey Smirnov','build@constructpro.kz','+77012220020',4),
('AulFood','Saule Baizakova','fresh@aulfood.kz','+77012220021',6),
('Bright Solar KZ','Erbolat Turebayev','info@brightsolar.kz','+77012220022',14),
('AutoParts Central','Denis Kozlov','parts@autocentral.kz','+77012220023',7),
('BookWorld KZ','Zhanar Issayeva','orders@bookworld.kz','+77012220024',2),
('CleanChem Solutions','Maxim Lebedev','orders@cleanchem.kz','+77012220025',8),
('Silk Road Trade','Askhat Suleimenov','trade@silkroad.kz','+77012220026',33),
('Eurasia Logistics','Dmitry Popov','ops@eurasialog.kz','+77012220027',31),
('Green Valley Agro','Bakhyt Nurpeisov','agro@greenvalley.kz','+77012220028',11),
('KazMineral Supply','Yerbol Massimov','minerals@kazmineral.kz','+77012220029',30),
('Darhan Beverages','Galiya Tulegenova','orders@darhan.kz','+77012220030',9),
('Steppe Grain Co','Malik Orynbaev','grain@steppeco.kz','+77012220031',12),
('TurboPost Express','Vlad Tsoi','express@turbopost.kz','+77012220032',1),
('MedSupply KZ','Aida Balgabekova','med@medsupply.kz','+77012220033',2),
('CosmoTech','Arsen Dauletov','info@cosmotech.kz','+77012220034',1),
('Zhuldyz Cosmetics','Madina Kuanysheva','orders@zhuldyz.kz','+77012220035',3),
('KorgalzhynOil','Talgat Iskakov','supply@korgalzhynoil.kz','+77012220036',2),
('Premium Meat KZ','Rustem Zhanbolatov','orders@premiummeat.kz','+77012220037',11),
('SafeGuard Security','Alexey Novikov','equip@safeguard.kz','+77012220038',1),
('TianShan Water','Nurmukhan Aliyev','orders@tianshanwater.kz','+77012220039',15),
('Golden Apples','Kamila Sadykova','sales@goldenapples.kz','+77012220040',1),
('AlmatyPack','Miras Yessimov','pack@almatypack.kz','+77012220041',1),
('TopDelivery Co','Zhandos Aimurzaev','ops@topdelivery.kz','+77012220042',2),
('KazTextilPro','Farida Ospanova','textile@kaztextilpro.kz','+77012220043',3),
('Digital Systems KZ','Ilya Petrov','info@digitalsystems.kz','+77012220044',1),
('Astana Fresh','Saya Karimova','fresh@astanafresh.kz','+77012220045',2),
('Caspian Fish Trade','Baurzhan Turmagambetov','fish@caspiantrade.kz','+77012220046',10),
('Balkhash Mining Co','Yernur Abdullin','supply@balkhash.kz','+77012220047',22),
('EcoClean Products','Lyudmila Sokolova','eco@ecoclean.kz','+77012220048',1),
('Atlas Ceramic','Yeldos Smagulev','orders@atlasceramic.kz','+77012220049',3),
('KazWood Crafts','Beibit Kozhakov','wood@kazwood.kz','+77012220050',8),
('PowerGrid Equip','Timur Aitbayev','power@powergrid.kz','+77012220051',18),
('Sunrise Dairy','Gulim Nurmukhanova','dairy@sunrise.kz','+77012220052',11),
('TuranBooks','Aizhan Serikova','info@turanbooks.kz','+77012220053',17),
('FastBolt Hardware','Saken Temirov','hard@fastbolt.kz','+77012220054',4),
('SilverLine Jewellery','Anna Kovaleva','orders@silverline.kz','+77012220055',1),
('HighPeak Sports','Olzhas Nurmagambetov','sports@highpeak.kz','+77012220056',1),
('CloudNet Telecom','Artem Belov','equip@cloudnet.kz','+77012220057',2),
('Samal Flowers','Raushan Nurkasymova','flowers@samal.kz','+77012220058',1),
('DeltaCargo','Pavel Mikhailov','ops@deltacargo.kz','+77012220059',1),
('KazChemIndustry','Zhasulan Ospanov','chem@kazchem.kz','+77012220060',7),
('OrientExpress','Aibek Nurzhanov','express@orient.kz','+77012220061',33),
('NurPrint Studio','Dinara Alimzhanova','print@nurprint.kz','+77012220062',1),
('AgriParts KZ','Medet Zhakypov','parts@agriparts.kz','+77012220063',11),
('BioHealth Labs','Saltanat Mursalimova','lab@biohealth.kz','+77012220064',2),
('Central Motors','Ruslan Tursunbaev','motors@centralmotors.kz','+77012220065',4),
('Qanat Plastics','Berik Mazhitov','plastic@qanat.kz','+77012220066',5),
('RoyalHome Decor','Lyazzat Amirova','decor@royalhome.kz','+77012220067',1),
('TransEurasiaRail','Damir Sultangazin','rail@transeurasia.kz','+77012220068',2),
('ZhambylCement','Kuanysh Aldabergenov','cement@zhambyl.kz','+77012220069',6),
('AqtauPort Services','Zhomart Kenzhegaliyev','port@aqtauport.kz','+77012220070',14),
('UstKamGormet','Yevgeniy Sokolov','food@ustkamgormet.kz','+77012220071',8),
('NomadTech Solutions','Ernar Moldashev','tech@nomadtech.kz','+77012220072',1),
('GreenHouse Garden','Aigul Serikbayeva','garden@greenhouse.kz','+77012220073',15),
('KostanayFlour','Mereke Bakenov','flour@kostflour.kz','+77012220074',11),
('SemeyTrade','Kazbek Nurzhanov','trade@semeytrade.kz','+77012220075',9),
('PavlodarSteel','Asylbek Dosmagambetov','steel@pavsteel.kz','+77012220076',7),
('Shymkent Spices','Rabiga Nurtazina','spices@shymkentspice.kz','+77012220077',3),
('AstanaOffice Pro','Nikolay Kazantsev','office@astanaoffice.kz','+77012220078',2),
('Arman Logistics','Arman Duisekeyev','info@armanlog.kz','+77012220079',1),
('EnergoKZ','Saltanat Baitasova','energy@energokz.kz','+77012220080',18);

-- ---------- 7. routes (80 rows) ----------
INSERT INTO routes (origin_city_id, dest_city_id, distance_km, est_duration_hours) VALUES
(1,2,1250,14.0),(2,1,1250,14.0),(1,3,690,8.0),(3,1,690,8.0),
(1,4,1000,11.0),(4,1,1000,11.0),(2,3,1600,18.0),(3,2,1600,18.0),
(2,4,480,5.5),(4,2,480,5.5),(1,6,500,6.0),(6,1,500,6.0),
(2,7,420,5.0),(7,2,420,5.0),(1,8,970,11.0),(8,1,970,11.0),
(2,5,1240,14.0),(5,2,1240,14.0),(1,10,2700,28.0),(10,1,2700,28.0),
(2,11,830,9.5),(11,2,830,9.5),(2,12,500,6.0),(12,2,500,6.0),
(1,15,300,3.5),(15,1,300,3.5),(1,32,250,3.0),(32,1,250,3.0),
(3,33,120,1.5),(33,3,120,1.5),(1,33,800,9.0),(33,1,800,9.0),
(2,34,2500,26.0),(34,2,2500,26.0),(1,51,350,4.0),(51,1,350,4.0),
(10,14,700,8.0),(14,10,700,8.0),(4,20,30,0.5),(20,4,30,0.5),
(7,18,130,1.5),(18,7,130,1.5),(5,42,1200,13.0),(42,5,1200,13.0),
(8,9,200,2.5),(9,8,200,2.5),(11,19,50,0.7),(19,11,50,0.7),
(1,57,80,1.0),(57,1,80,1.0),(3,58,30,0.4),(58,3,30,0.4),
(3,17,160,2.0),(17,3,160,2.0),(6,54,60,0.8),(54,6,60,0.8),
(10,53,750,8.5),(53,10,750,8.5),(1,9,750,8.5),(9,1,750,8.5),
(4,7,400,4.5),(7,4,400,4.5),(2,16,300,3.5),(16,2,300,3.5),
(31,34,3200,34.0),(34,31,3200,34.0),(1,56,1800,20.0),(56,1,1800,20.0),
(5,13,600,7.0),(13,5,600,7.0),(14,21,150,2.0),(21,14,150,2.0),
(8,24,120,1.5),(24,8,120,1.5),(4,22,400,4.5),(22,4,400,4.5),
(4,30,550,6.5),(30,4,550,6.5),(2,9,700,8.0),(9,2,700,8.0);

--  8. shipments (350 rows via numbers helper) 
-- Helper table for generating numeric series
INSERT INTO shipments (
    client_id, warehouse_id, weight_kg, volume_m3,
    description, created_at, priority
)
WITH RECURSIVE nums AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM nums
    WHERE n < 50
)
SELECT
    ((a.n - 1) * 50 + b.n - 1) % 80 + 1 AS client_id,
    ((a.n - 1) * 50 + b.n - 1) % 50 + 1 AS warehouse_id,
    ROUND(50 + ((a.n * 13 + b.n * 7) % 4950), 2) AS weight_kg,
    ROUND(0.5 + ((a.n * 5 + b.n * 3) % 40), 2) AS volume_m3,
    ELT(
        ((a.n - 1) * 50 + b.n - 1) % 10 + 1,
        'General merchandise',
        'Electronics shipment',
        'Food products',
        'Construction materials',
        'Machinery parts',
        'Textile goods',
        'Chemical supplies',
        'Agricultural produce',
        'Consumer goods',
        'Medical supplies'
    ) AS description,
    DATE_ADD(
        '2025-08-01 06:00:00',
        INTERVAL ((a.n - 1) * 50 + b.n - 1) * 6 HOUR
    ) AS created_at,
    ELT(
        ((a.n - 1) * 50 + b.n - 1) % 4 + 1,
        'normal',
        'high',
        'normal',
        'urgent'
    ) AS priority
FROM nums a
CROSS JOIN nums b
WHERE ((a.n - 1) * 50 + b.n) <= 350;
--  9. deliveries (350 rows with diverse statuses) 
-- For each shipment we create one delivery.
-- Status distribution is realistic: ~70% delivered, ~18% delayed, ~7% failed, ~5% in_transit

INSERT INTO deliveries
    (shipment_id, driver_id, vehicle_id, route_id, warehouse_id,
     status, pickup_date, expected_date, actual_date, delay_minutes, delivery_cost)
SELECT
    s.shipment_id,
    ((s.shipment_id - 1) % 70) + 1                       AS driver_id,
    ((s.shipment_id - 1) % 80) + 1                       AS vehicle_id,
    ((s.shipment_id - 1) % 80) + 1                       AS route_id,
    s.warehouse_id,
    CASE
        WHEN s.shipment_id % 20 = 0 THEN 'failed'
        WHEN s.shipment_id % 17 = 0 THEN 'in_transit'
        WHEN s.shipment_id % 9  = 0 THEN 'delayed'
        WHEN s.shipment_id % 7  = 0 THEN 'delayed'
        ELSE 'delivered'
    END                                                  AS status,
    DATE_ADD(s.created_at, INTERVAL 2 HOUR)              AS pickup_date,
    DATE_ADD(s.created_at, INTERVAL 20 HOUR)             AS expected_date,
    CASE
        WHEN s.shipment_id % 20 = 0 THEN NULL                                                            -- failed
        WHEN s.shipment_id % 17 = 0 THEN NULL                                                            -- in_transit
        WHEN s.shipment_id % 9  = 0 THEN DATE_ADD(s.created_at, INTERVAL 32 HOUR)                        -- seriously delayed
        WHEN s.shipment_id % 7  = 0 THEN DATE_ADD(s.created_at, INTERVAL 22 HOUR)                        -- slightly delayed
        WHEN s.shipment_id % 5  = 0 THEN DATE_ADD(s.created_at, INTERVAL 20 HOUR)                        -- exactly on time
        ELSE DATE_ADD(s.created_at, INTERVAL 18 HOUR)                                                    -- early / on time
    END                                                  AS actual_date,
    CASE
        WHEN s.shipment_id % 20 = 0 THEN 0
        WHEN s.shipment_id % 17 = 0 THEN 0
        WHEN s.shipment_id % 9  = 0 THEN 720
        WHEN s.shipment_id % 7  = 0 THEN 120
        ELSE 0
    END                                                  AS delay_minutes,
    ROUND(5000 + ((s.shipment_id * 37) % 145000), 2)     AS delivery_cost
FROM shipments s;


--  10. delivery_status_log (initial seed) 
INSERT INTO delivery_status_log (delivery_id, old_status, new_status, changed_by)
SELECT delivery_id, NULL, status, 'system_init' FROM deliveries LIMIT 50;

