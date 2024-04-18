INSERT INTO vehicle VALUES(1, 'Toyota', 'Camry',2018,60.00,'available',5,2.5),
(2,'Honda','Accord',2019, 65.00, 'available', 5, 2.0),
(3,'Ford', 'Explorer', 2020, 80.00, 'notAvailable', 7, 3.5),
(4, 'Chevrolet', 'Tahoe', 2017, 90.00, 'available', 8, 5.3),
(5, 'Nissan', 'Altima', 2019, 55.00,'available', 5, 2.5),
(6, 'BMW', 'X5', 2021, 120.00, 'notAvailable', 5, 3.0),
(7,'Mercedes-Benz', 'E-Class', 2020, 110.00, 'available', 5, 3.0),
(8, 'Audi', 'A4', 2018, 100.00,'available',5,2.0),
(9,'Volkswagen', 'Jetta', 2019, 55.00, 'available', 5, 1.4),
(10, 'Tesla', 'Model S', 2021, 150.00, 'available', 5, 0.0);


INSERT INTO customer (customer_id, first_name, last_name, email, phone_number) 
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210'),
    (3, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-123-4567'),
    (4, 'Bob', 'Brown', 'bob.brown@example.com', '789-456-1230'),
    (5, 'Emily', 'Davis', 'emily.davis@example.com', '456-789-0123'),
    (6, 'Michael', 'Wilson', 'michael.wilson@example.com', '321-654-9870'),
    (7, 'Sarah', 'Martinez', 'sarah.martinez@example.com', '654-321-0987'),
    (8, 'David', 'Anderson', 'david.anderson@example.com', '987-654-3210'),
    (9, 'Laura', 'Taylor', 'laura.taylor@example.com', '123-456-7890'),
    (10, 'Daniel', 'Clark', 'daniel.clark@example.com', '789-012-3456');
    


INSERT INTO Lease (lease_id, vehicle_id, customer_id, start_date, end_date, type) 
VALUES
    (1, 1, 1, '2024-04-18', '2024-04-25', 'Daily'),
    (2, 2, 2, '2024-04-19', '2024-05-19', 'Monthly'),
    (3, 3, 3, '2024-04-20', '2024-04-22', 'Daily'),
    (4, 4, 4, '2024-04-21', '2024-05-21', 'Monthly'),
    (5, 5, 5, '2024-04-22', '2024-04-29', 'Daily'),
    (6, 6, 6, '2024-04-23', '2024-05-23', 'Monthly'),
    (7, 7, 7, '2024-04-24', '2024-04-26', 'Daily'),
    (8, 8, 8, '2024-04-25', '2024-05-25', 'Monthly'),
    (9, 9, 9, '2024-04-26', '2024-05-03', 'Daily'),
    (10, 10, 10, '2024-04-27', '2024-05-27', 'Monthly');
    
INSERT INTO Payment (payment_id, lease_id, payment_date, amount)
VALUES
    (1, 1, '2024-04-18', 500.00),
    (2, 2, '2024-04-19', 700.00),
    (3, 3, '2024-04-20', 450.00),
    (4, 4, '2024-04-21', 800.00),
    (5, 5, '2024-04-22', 600.00),
    (6, 6, '2024-04-23', 900.00),
    (7, 7, '2024-04-24', 550.00),
    (8, 8, '2024-04-25', 750.00),
    (9, 9, '2024-04-26', 400.00),
    (10, 10, '2024-04-27', 850.00);


    

