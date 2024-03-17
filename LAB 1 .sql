CREATE DATABASE IF NOT EXISTS lab_mysql;
USE lab_mysql;

DROP TABLE IF EXISTS cars;
CREATE TABLE cars (
    vin VARCHAR(17) PRIMARY KEY,
    manufacturer VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year_ INT NOT NULL,
    color VARCHAR(30) NOT NULL
);
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id VARCHAR(17) PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(50),
    state_province VARCHAR(50),
    country VARCHAR(50),
    zip_postal_code VARCHAR(10)
);

DROP TABLE IF EXISTS salespersons;
CREATE TABLE salespersons (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    name_staff VARCHAR(100) NOT NULL,
    store VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS invoices;
CREATE TABLE invoices (
    invoice_number INT AUTO_INCREMENT PRIMARY KEY,
    invoice_date DATE NOT NULL,
    car_vin VARCHAR(17),
    customer_id VARCHAR(17),
    staff_id INT,
    FOREIGN KEY (car_vin) REFERENCES cars (vin),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (staff_id) REFERENCES salespersons (staff_id)
);

INSERT INTO Cars (id, vin, manufacturer, model, year, color)
VALUES 
(1, '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
(2, 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
(3, 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
(4, 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
(5, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
(6, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');

INSERT INTO Customers (id, cust_id, cust_name, cust_phone, cust_email, cust_address, cust_city, cust_state, cust_country, cust_zipcode)
VALUES 
(0, 10001, 'Pablo Picasso', '+3463617638', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', 28045),
(1, 20001, 'Abraham Lincoln', '+13059077086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', 33130),
(2, 30001, 'Napoléon Bonaparte', '+33179754000', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', 75008);

INSERT INTO Salespersons (id, staff_id, name, store)
VALUES 
(1, '00001', 'Petey Cruiser', 'Madrid'),
(2, '00002', 'Anna Sthesia', 'Barcelona'),
(3, '00003', 'Paul Molive', 'Berlin'),
(4, '00004', 'Gail Forcewind', 'Paris'),
(5, '00005', 'Paige Turner', 'Mimia'),
(6, '00006', 'Bob Frapples', 'Mexico City'),
(7, '00007', 'Walter Melon', 'Amsterdam'),
(8, '00008', 'Shonda Leer', 'São Paulo');



INSERT INTO Invoices (id, invoice_number, date, car, customer, salesperson)
VALUES 
(1, 852399038, STR_TO_DATE('22-08-2018','%d-%m-%Y'), 1, 0, 3),
(2, 731166526, STR_TO_DATE('31-12-2018','%d-%m-%Y'), 3, 2, 5),
(3, 271135104, STR_TO_DATE('22-01-2019','%d-%m-%Y'), 2, 1, 7);