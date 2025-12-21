CREATE DATABASE IF NOT EXISTS retail_db;
USE retail_db;

-- Customers
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT
);

-- Products
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2),
    stock INT,
    category VARCHAR(50)
);

-- Orders
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Order Items
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Payments
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    method VARCHAR(20),
    status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Sample Data
INSERT INTO Customers (name, email, phone, address) VALUES
('Ali Khan', 'ali@gmail.com', '9876543210', 'Mumbai'),
('Sara Ahmed', 'sara@gmail.com', '9876501234', 'Delhi');

INSERT INTO Products (name, description, price, stock, category) VALUES
('Laptop', 'Gaming Laptop', 899.99, 10, 'Electronics'),
('Smartphone', 'Android Phone', 599.99, 15, 'Electronics');

INSERT INTO Orders (customer_id, order_date, status, total_amount) VALUES
(1, '2025-01-10', 'Delivered', 899.99),
(2, '2025-01-11', 'Pending', 599.99);

INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 899.99),
(2, 2, 1, 599.99);

INSERT INTO Payments (order_id, payment_date, amount, method, status) VALUES
(1, '2025-01-10', 899.99, 'Credit Card', 'Paid'),
(2, '2025-01-11', 599.99, 'COD', 'Pending');
