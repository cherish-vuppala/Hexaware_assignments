CREATE DATABASE car_rental_db;
USE car_rental_db;

CREATE TABLE Vehicle (
    vehicle_id INT PRIMARY KEY,
    make VARCHAR(255),
    model VARCHAR(255),
    year INT,
    daily_rate DECIMAL(10, 2),
    status ENUM('available', 'notAvailable'),
    passenger_capacity INT,
    engine_capacity INT
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Lease (
    lease_id INT PRIMARY KEY,
    vehicle_id INT,
    customer_id INT,
    start_date DATE,
    end_date DATE,
    type ENUM('Daily', 'Monthly'),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    lease_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (lease_id) REFERENCES Lease(lease_id)
);


