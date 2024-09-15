/*
Milestone 3 - Project script
Group 3
Members: Pouya Rad, Seyed Hossein Sajedi, Joshua Luczon
*/

SET AUTOCOMMIT OFF;

----- Create tables: Employees, Vehicle, Customer, CustomerService, Appointments, Sales -----
                             ----- Creation Script -----

-- Making sure the tables do not exist before the creation script -- 
DROP TABLE Employees;
DROP TABLE Vehicle;
DROP TABLE Customer;
DROP TABLE CustomerService;
DROP TABLE Appointments;
DROP TABLE Sales;

-- Table Employees -- 
CREATE TABLE Employees (
    employeeID NUMBER(4) PRIMARY KEY,
    employeeName VARCHAR2(50) NOT NULL,
    empEmail VARCHAR2(50) NOT NULL,
    empPhone NUMBER(11) NOT NULL,
    jobTitle VARCHAR2(30) NOT NULL,
    supervisorID NUMBER(4),
    CONSTRAINT fk_supervisorID FOREIGN KEY (supervisorID) REFERENCES Employees(employeeID)
);

-- Table Vehicle -- 
CREATE TABLE Vehicle (
    VIN VARCHAR2(17) PRIMARY KEY,
    make VARCHAR2(30) NOT NULL,
    model VARCHAR2(30) NOT NULL,
    vehiclePrice NUMBER(9, 2) NOT NULL,
    color VARCHAR2(20) NOT NULL,
    status VARCHAR2(20) NOT NULL
);

-- Table Customer -- 
CREATE TABLE Customer (
    customerID NUMBER(4) PRIMARY KEY,
    customerName VARCHAR2(50) NOT NULL,
    custPhone NUMBER(11) NOT NULL,
    custEmail VARCHAR2(50) NOT NULL,
    custVin VARCHAR2(17),
    CONSTRAINT fk_custVin FOREIGN KEY (custVin) REFERENCES Vehicle(VIN)
);

-- Table CustomerService -- 
CREATE TABLE CustomerService (
    serviceID NUMBER(4) PRIMARY KEY,
    serviceDescription VARCHAR2(255) NOT NULL,
    servicePrice NUMBER(9, 2) NOT NULL,
    customerID NUMBER(4) NOT NULL,
    VIN VARCHAR2(17) NOT NULL,
    CONSTRAINT fk_serviceCustomerID FOREIGN KEY (customerID) REFERENCES Customer(customerID),
    CONSTRAINT fk_serviceVIN FOREIGN KEY (VIN) REFERENCES Vehicle(VIN)
);

-- Table Appointments --
CREATE TABLE Appointments (
    appointmentID NUMBER(4) PRIMARY KEY,
    appointmentDate DATE NOT NULL,
    customerID NUMBER(4) NOT NULL,
    VIN VARCHAR2(17) NOT NULL,
    serviceID NUMBER(4) NOT NULL,
    CONSTRAINT fk_appointmentCustomerID FOREIGN KEY (customerID) REFERENCES Customer(customerID),
    CONSTRAINT fk_appointmentVIN FOREIGN KEY (VIN) REFERENCES Vehicle(VIN),
    CONSTRAINT fk_appointmentServiceID FOREIGN KEY (serviceID) REFERENCES CustomerService(serviceID)
);

-- Table Sales --
CREATE TABLE Sales (
    saleID NUMBER(4) PRIMARY KEY,
    saleDate DATE NOT NULL,
    customerID NUMBER(4) NOT NULL,
    VIN VARCHAR2(17) NOT NULL,
    salesRepNumber NUMBER(4) NOT NULL,
    totalPrice NUMBER(9, 2) NOT NULL,
    paymentMethod VARCHAR2(20) NOT NULL,
    CONSTRAINT fk_salesCustomerID FOREIGN KEY (customerID) REFERENCES Customer(customerID),
    CONSTRAINT fk_salesVIN FOREIGN KEY (VIN) REFERENCES Vehicle(VIN),
    CONSTRAINT fk_salesRepNumber FOREIGN KEY (salesRepNumber) REFERENCES Employees(employeeID)
);


----- Inputting data into the tables -----
      ----- Sample Data Script -----

-- EMPLOYEES SAMPLE DATA -- 
SELECT * FROM Employees;

INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1001, 'John Doe', 'john.doe@example.com', 9055551212, 'Sales Representative', NULL);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1002, 'Jane Smith', 'jane.smith@example.com', 9055551213, 'Sales Manager', 1001);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1003, 'Emily Davis', 'emily.davis@example.com', 9055551214, 'Technician', 1002);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1004, 'Michael Brown', 'michael.brown@example.com', 9055551215, 'Service Manager', 1002);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1005, 'Linda White', 'linda.white@example.com', 9055551216, 'Receptionist', NULL);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1006, 'David Wilson', 'david.wilson@example.com', 9055551217, 'Finance Manager', NULL);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1007, 'Barbara Moore', 'barbara.moore@example.com', 9055551218, 'Parts Specialist', 1004);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1008, 'Daniel Taylor', 'daniel.taylor@example.com', 9055551219, 'Sales Representative', 1001);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1009, 'Susan Harris', 'susan.harris@example.com', 9055551220, 'Technician', 1003);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1010, 'Paul Clark', 'paul.clark@example.com', 9055551221, 'Service Advisor', 1004);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1011, 'Mary Lewis', 'mary.lewis@example.com', 9055551222, 'Sales Representative', 1001);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1012, 'James Walker', 'james.walker@example.com', 9055551223, 'Technician', 1003);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1013, 'Patricia Hall', 'patricia.hall@example.com', 9055551224, 'Service Manager', 1002);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1014, 'Robert Young', 'robert.young@example.com', 9055551225, 'Parts Specialist', 1004);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1015, 'Jennifer Allen', 'jennifer.allen@example.com', 9055551226, 'Receptionist', NULL);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1016, 'Charles King', 'charles.king@example.com', 9055551227, 'Finance Manager', NULL);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1017, 'Jessica Wright', 'jessica.wright@example.com', 9055551228, 'Sales Representative', 1001);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1018, 'Christopher Lopez', 'christopher.lopez@example.com', 9055551229, 'Technician', 1003);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1019, 'Sarah Hill', 'sarah.hill@example.com', 9055551230, 'Service Advisor', 1004);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1020, 'Mark Scott', 'mark.scott@example.com', 9055551231, 'Sales Representative', 1001);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1021, 'Elizabeth Green', 'elizabeth.green@example.com', 9055551232, 'Parts Specialist', 1004);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1022, 'Steven Adams', 'steven.adams@example.com', 9055551233, 'Finance Manager', NULL);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1023, 'Margaret Baker', 'margaret.baker@example.com', 9055551234, 'Sales Manager', 1001);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1024, 'Joshua Gonzalez', 'joshua.gonzalez@example.com', 9055551235, 'Technician', 1003);
INSERT INTO Employees (employeeID, employeeName, empEmail, empPhone, jobTitle, supervisorID) VALUES
(1025, 'Ashley Nelson', 'ashley.nelson@example.com', 9055551236, 'Receptionist', NULL);

-- VEHICLE SAMPLE DATA --
SELECT * FROM Vehicle;

INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123456', 'Honda', 'Civic', 25000.00, 'Black', 'Available');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123457', 'Toyota', 'Corolla', 23000.00, 'White', 'Sold');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123458', 'Ford', 'Mustang', 55000.00, 'Red', 'Available');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123459', 'Chevrolet', 'Camaro', 45000.00, 'Blue', 'Under Maintenance');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123460', 'Tesla', 'Model 3', 60000.00, 'Silver', 'Available');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123461', 'Nissan', 'Altima', 27000.00, 'Gray', 'Sold');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123462', 'BMW', '3 Series', 50000.00, 'Black', 'Available');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123463', 'Audi', 'A4', 48000.00, 'White', 'Sold');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123464', 'Mercedes-Benz', 'C-Class', 54000.00, 'Blue', 'Available');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123465', 'Lexus', 'IS', 53000.00, 'Red', 'Available');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123466', 'Hyundai', 'Elantra', 22000.00, 'Black', 'Sold');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123467', 'Kia', 'Optima', 24000.00, 'White', 'Available');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123468', 'Mazda', '6', 26000.00, 'Blue', 'Under Maintenance');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123469', 'Subaru', 'Impreza', 28000.00, 'Silver', 'Available');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123470', 'Volkswagen', 'Passat', 29000.00, 'Gray', 'Sold');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123471', 'Volvo', 'S60', 52000.00, 'Black', 'Available');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123472', 'Jaguar', 'XE', 60000.00, 'White', 'Available');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123473', 'Land Rover', 'Range Rover', 85000.00, 'Blue', 'Sold');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123474', 'Porsche', 'Macan', 75000.00, 'Red', 'Available');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123475', 'Acura', 'TLX', 46000.00, 'Silver', 'Available');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123476', 'Infiniti', 'Q50', 49000.00, 'Gray', 'Sold');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123477', 'Alfa Romeo', 'Giulia', 56000.00, 'Black', 'Available');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123478', 'Genesis', 'G70', 47000.00, 'White', 'Available');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123479', 'Cadillac', 'CT4', 51000.00, 'Blue', 'Sold');
INSERT INTO Vehicle (VIN, make, model, vehiclePrice, color, status) VALUES
('1HGCM82633A123480', 'BMW', 'M3', 75000.00, 'Black', 'Available');

-- CUSTOMER SAMPLE DATA -- 
SELECT * FROM Customer;

INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2001, 'Alice Johnson', 9055551221, 'alice.johnson@example.com', '1HGCM82633A123456');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2002, 'Bob Williams', 9055551222, 'bob.williams@example.com', '1HGCM82633A123457');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2003, 'Catherine Brown', 9055551223, 'catherine.brown@example.com', '1HGCM82633A123458');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2004, 'David Clark', 9055551224, 'david.clark@example.com', '1HGCM82633A123459');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2005, 'Eva Thompson', 9055551225, 'eva.thompson@example.com', '1HGCM82633A123460');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2006, 'Frank Miller', 9055551226, 'frank.miller@example.com', '1HGCM82633A123461');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2007, 'Grace Lee', 9055551227, 'grace.lee@example.com', '1HGCM82633A123462');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2008, 'Henry Scott', 9055551228, 'henry.scott@example.com', '1HGCM82633A123463');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2009, 'Irene Lewis', 9055551229, 'irene.lewis@example.com', '1HGCM82633A123464');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2010, 'Jack Wilson', 9055551230, 'jack.wilson@example.com', '1HGCM82633A123465');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2011, 'Karen Walker', 9055551231, 'karen.walker@example.com', '1HGCM82633A123466');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2012, 'Larry Young', 9055551232, 'larry.young@example.com', '1HGCM82633A123467');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2013, 'Maria Allen', 9055551233, 'maria.allen@example.com', '1HGCM82633A123468');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2014, 'Nathan King', 9055551234, 'nathan.king@example.com', '1HGCM82633A123469');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2015, 'Olivia Wright', 9055551235, 'olivia.wright@example.com', '1HGCM82633A123470');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2016, 'Peter Harris', 9055551236, 'peter.harris@example.com', '1HGCM82633A123471');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2017, 'Quincy Green', 9055551237, 'quincy.green@example.com', '1HGCM82633A123472');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2018, 'Rachel Baker', 9055551238, 'rachel.baker@example.com', '1HGCM82633A123473');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2019, 'Samuel Gonzalez', 9055551239, 'samuel.gonzalez@example.com', '1HGCM82633A123474');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2020, 'Tina Nelson', 9055551240, 'tina.nelson@example.com', '1HGCM82633A123475');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2021, 'Ursula Martinez', 9055551241, 'ursula.martinez@example.com', '1HGCM82633A123476');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2022, 'Victor Robinson', 9055551242, 'victor.robinson@example.com', '1HGCM82633A123477');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2023, 'Wendy Campbell', 9055551243, 'wendy.campbell@example.com', '1HGCM82633A123478');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2024, 'Xavier Perez', 9055551244, 'xavier.perez@example.com', '1HGCM82633A123479');
INSERT INTO Customer (customerID, customerName, custPhone, custEmail, custVin) VALUES
(2025, 'Yvonne Torres', 9055551245, 'yvonne.torres@example.com', '1HGCM82633A123480');

-- CUSTOMESERVICE SAMPLE DATA --
SELECT * FROM CustomerService;

INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3001, 'Oil change', 49.99, 2001, '1HGCM82633A123456');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3002, 'Tire rotation', 29.99, 2002, '1HGCM82633A123457');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3003, 'Brake inspection', 79.99, 2003, '1HGCM82633A123458');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3004, 'Battery replacement', 99.99, 2004, '1HGCM82633A123459');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3005, 'Engine tune-up', 199.99, 2005, '1HGCM82633A123460');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3006, 'Transmission fluid change', 149.99, 2006, '1HGCM82633A123461');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3007, 'Air filter replacement', 39.99, 2007, '1HGCM82633A123462');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3008, 'Cabin filter replacement', 49.99, 2008, '1HGCM82633A123463');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3009, 'Spark plug replacement', 119.99, 2009, '1HGCM82633A123464');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3010, 'Coolant flush', 89.99, 2010, '1HGCM82633A123465');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3011, 'Power steering flush', 79.99, 2011, '1HGCM82633A123466');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3012, 'Wheel alignment', 129.99, 2012, '1HGCM82633A123467');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3013, 'Brake fluid flush', 99.99, 2013, '1HGCM82633A123468');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3014, 'Tire balancing', 39.99, 2014, '1HGCM82633A123469');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3015, 'Exhaust system inspection', 69.99, 2015, '1HGCM82633A123470');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3016, 'Suspension inspection', 89.99, 2016, '1HGCM82633A123471');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3017, 'Headlight replacement', 29.99, 2017, '1HGCM82633A123472');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3018, 'Taillight replacement', 29.99, 2018, '1HGCM82633A123473');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3019, 'Windshield wiper replacement', 19.99, 2019, '1HGCM82633A123474');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3020, 'AC system recharge', 129.99, 2020, '1HGCM82633A123475');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3021, 'Fuel system cleaning', 159.99, 2021, '1HGCM82633A123476');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3022, 'Timing belt replacement', 499.99, 2022, '1HGCM82633A123477');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3023, 'Water pump replacement', 399.99, 2023, '1HGCM82633A123478');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3024, 'Radiator replacement', 349.99, 2024, '1HGCM82633A123479');
INSERT INTO CustomerService (serviceID, serviceDescription, servicePrice, customerID, VIN) VALUES
(3025, 'Transmission repair', 1299.99, 2025, '1HGCM82633A123480');

-- APPOINTMENTS SAMPLE DATA -- 
SELECT * FROM Appointments;

INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4001, TO_DATE('2024-07-01', 'YYYY-MM-DD'), 2001, '1HGCM82633A123456', 3001);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4002, TO_DATE('2024-07-02', 'YYYY-MM-DD'), 2002, '1HGCM82633A123457', 3002);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4003, TO_DATE('2024-07-03', 'YYYY-MM-DD'), 2003, '1HGCM82633A123458', 3003);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4004, TO_DATE('2024-07-04', 'YYYY-MM-DD'), 2004, '1HGCM82633A123459', 3004);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4005, TO_DATE('2024-07-05', 'YYYY-MM-DD'), 2005, '1HGCM82633A123460', 3005);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4006, TO_DATE('2024-07-06', 'YYYY-MM-DD'), 2006, '1HGCM82633A123461', 3006);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4007, TO_DATE('2024-07-07', 'YYYY-MM-DD'), 2007, '1HGCM82633A123462', 3007);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4008, TO_DATE('2024-07-08', 'YYYY-MM-DD'), 2008, '1HGCM82633A123463', 3008);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4009, TO_DATE('2024-07-09', 'YYYY-MM-DD'), 2009, '1HGCM82633A123464', 3009);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4010, TO_DATE('2024-07-10', 'YYYY-MM-DD'), 2010, '1HGCM82633A123465', 3010);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4011, TO_DATE('2024-07-11', 'YYYY-MM-DD'), 2011, '1HGCM82633A123466', 3011);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4012, TO_DATE('2024-07-12', 'YYYY-MM-DD'), 2012, '1HGCM82633A123467', 3012);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4013, TO_DATE('2024-07-13', 'YYYY-MM-DD'), 2013, '1HGCM82633A123468', 3013);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4014, TO_DATE('2024-07-14', 'YYYY-MM-DD'), 2014, '1HGCM82633A123469', 3014);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4015, TO_DATE('2024-07-15', 'YYYY-MM-DD'), 2015, '1HGCM82633A123470', 3015);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4016, TO_DATE('2024-07-16', 'YYYY-MM-DD'), 2016, '1HGCM82633A123471', 3016);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4017, TO_DATE('2024-07-17', 'YYYY-MM-DD'), 2017, '1HGCM82633A123472', 3017);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4018, TO_DATE('2024-07-18', 'YYYY-MM-DD'), 2018, '1HGCM82633A123473', 3018);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4019, TO_DATE('2024-07-19', 'YYYY-MM-DD'), 2019, '1HGCM82633A123474', 3019);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4020, TO_DATE('2024-07-20', 'YYYY-MM-DD'), 2020, '1HGCM82633A123475', 3020);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4021, TO_DATE('2024-07-21', 'YYYY-MM-DD'), 2021, '1HGCM82633A123476', 3021);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4022, TO_DATE('2024-07-22', 'YYYY-MM-DD'), 2022, '1HGCM82633A123477', 3022);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4023, TO_DATE('2024-07-23', 'YYYY-MM-DD'), 2023, '1HGCM82633A123478', 3023);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4024, TO_DATE('2024-07-24', 'YYYY-MM-DD'), 2024, '1HGCM82633A123479', 3024);
INSERT INTO Appointments (appointmentID, appointmentDate, customerID, VIN, serviceID) VALUES
(4025, TO_DATE('2024-07-25', 'YYYY-MM-DD'), 2025, '1HGCM82633A123480', 3025);

-- SALES SAMPLE DATA -- 
SELECT * FROM Sales;

INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5001, TO_DATE('2024-07-01', 'YYYY-MM-DD'), 2001, '1HGCM82633A123456', 1001, 25000.00, 'Credit Card');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5002, TO_DATE('2024-07-02', 'YYYY-MM-DD'), 2002, '1HGCM82633A123457', 1002, 23000.00, 'Cash');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5003, TO_DATE('2024-07-03', 'YYYY-MM-DD'), 2003, '1HGCM82633A123458', 1003, 55000.00, 'Financing');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5004, TO_DATE('2024-07-04', 'YYYY-MM-DD'), 2004, '1HGCM82633A123459', 1004, 45000.00, 'Credit Card');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5005, TO_DATE('2024-06-05', 'YYYY-MM-DD'), 2005, '1HGCM82633A123460', 1005, 60000.00, 'Cash');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5006, TO_DATE('2024-06-06', 'YYYY-MM-DD'), 2006, '1HGCM82633A123461', 1006, 27000.00, 'Credit Card');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5007, TO_DATE('2024-06-07', 'YYYY-MM-DD'), 2007, '1HGCM82633A123462', 1007, 50000.00, 'Financing');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5008, TO_DATE('2024-06-08', 'YYYY-MM-DD'), 2008, '1HGCM82633A123463', 1008, 48000.00, 'Cash');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5009, TO_DATE('2024-05-09', 'YYYY-MM-DD'), 2009, '1HGCM82633A123464', 1009, 54000.00, 'Credit Card');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5010, TO_DATE('2024-05-10', 'YYYY-MM-DD'), 2010, '1HGCM82633A123465', 1010, 53000.00, 'Financing');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5011, TO_DATE('2024-05-11', 'YYYY-MM-DD'), 2011, '1HGCM82633A123466', 1011, 22000.00, 'Cash');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5012, TO_DATE('2024-05-12', 'YYYY-MM-DD'), 2012, '1HGCM82633A123467', 1012, 24000.00, 'Credit Card');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5013, TO_DATE('2024-05-13', 'YYYY-MM-DD'), 2013, '1HGCM82633A123468', 1013, 26000.00, 'Financing');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5014, TO_DATE('2024-04-14', 'YYYY-MM-DD'), 2014, '1HGCM82633A123469', 1014, 28000.00, 'Cash');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5015, TO_DATE('2024-04-15', 'YYYY-MM-DD'), 2015, '1HGCM82633A123470', 1015, 29000.00, 'Credit Card');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5016, TO_DATE('2024-04-16', 'YYYY-MM-DD'), 2016, '1HGCM82633A123471', 1016, 52000.00, 'Financing');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5017, TO_DATE('2024-04-17', 'YYYY-MM-DD'), 2017, '1HGCM82633A123472', 1017, 60000.00, 'Cash');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5018, TO_DATE('2024-04-18', 'YYYY-MM-DD'), 2018, '1HGCM82633A123473', 1018, 85000.00, 'Credit Card');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5019, TO_DATE('2024-04-19', 'YYYY-MM-DD'), 2019, '1HGCM82633A123474', 1019, 75000.00, 'Financing');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5020, TO_DATE('2024-04-20', 'YYYY-MM-DD'), 2020, '1HGCM82633A123475', 1020, 46000.00, 'Cash');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5021, TO_DATE('2024-03-21', 'YYYY-MM-DD'), 2021, '1HGCM82633A123476', 1021, 49000.00, 'Credit Card');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5022, TO_DATE('2024-03-22', 'YYYY-MM-DD'), 2022, '1HGCM82633A123477', 1022, 56000.00, 'Financing');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5023, TO_DATE('2024-02-23', 'YYYY-MM-DD'), 2023, '1HGCM82633A123478', 1023, 47000.00, 'Cash');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5024, TO_DATE('2024-02-24', 'YYYY-MM-DD'), 2024, '1HGCM82633A123479', 1024, 51000.00, 'Credit Card');
INSERT INTO Sales (saleID, saleDate, customerID, VIN, salesRepNumber, totalPrice, paymentMethod) VALUES
(5025, TO_DATE('2023-11-25', 'YYYY-MM-DD'), 2025, '1HGCM82633A123480', 1025, 75000.00, 'Financing');
--===================================================================================================--

----- Business Report quieries -----

--This view provides the total worth of each sales rep's sales. Its main purpose is to 
--identify the dealership's top performers for sales contest or promotion purposes.
--It can also be used to help determine the dealership's total overall sales. 
CREATE OR REPLACE VIEW TotalSalesByRep AS
SELECT E.employeeName, SUM(S.totalPrice) AS TotalSales
FROM Sales S
JOIN Employees E ON S.salesRepNumber = E.employeeID
HAVING SUM(S.totalPrice) > 60000
GROUP BY E.employeeName;

SELECT * FROM TotalSalesByRep;

--This view shows the count of sold, under maintenance, and available vehicles. 
--It is used to help the dealership manage its inventory.
CREATE OR REPLACE VIEW VehiclesSoldAndAvailable AS
SELECT make, model, status, COUNT(*) AS NumberOfVehicles
FROM Vehicle
WHERE STATUS = 'Sold'
GROUP BY make, model, status;

SELECT * FROM VehiclesSoldAndAvailable;

--This view documents every appointment with identifying service name, VIN, and customer name.
--It is used to help track a car's service history for documentation and insurance purposes.
CREATE OR REPLACE VIEW CustomerServiceAppointments AS
SELECT C.customerName, A.appointmentDate, S.serviceDescription, S.servicePrice, C.custVin
FROM Appointments A
JOIN Customer C ON A.customerID = C.customerID
JOIN CustomerService S ON A.serviceID = S.serviceID;

SELECT * FROM CustomerServiceAppointments;

--This view tracks total sales made in each month. It is used to analyse sales trends
--and make decisions based on sales and performance data.
CREATE OR REPLACE VIEW MonthlySalesReport AS
SELECT TO_CHAR(saleDate, 'YYYY-MON') AS Month, SUM(totalPrice) AS MonthlySales
FROM Sales
GROUP BY TO_CHAR(saleDate, 'YYYY-MON')
ORDER BY TO_CHAR(saleDate, 'YYYY-MON') DESC;

SELECT * FROM MonthlySalesReport;

--EMPLOYEE REPORTS TO WHOM
CREATE OR REPLACE VIEW SalesRepSupervisionSpecific AS
SELECT 
    E1.employeeID AS SalesRepID,
    E1.employeeName AS SalesRepName,
    E1.supervisorID AS SupervisorID,
    E2.employeeName AS SupervisorName
FROM 
    Employees E1
LEFT JOIN 
    Employees E2 
ON 
    E1.supervisorID = E2.employeeID
WHERE 
    E1.jobTitle = 'Sales Representative'
    AND E1.supervisorID BETWEEN 1001 AND 1004;

SELECT * FROM SalesRepSupervisionSpecific;


--EASY ACCESS TO SALES TABLE FOR PRESENTATION PURPOSES
SELECT * FROM SALES;

