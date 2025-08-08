# Create database and use it
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;
# Create table
CREATE TABLE IF NOT EXISTS orders_raw (
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    order_time TIME,
    aging INT,
    customer_id VARCHAR(50),
    gender VARCHAR(20),
    device_type VARCHAR(50),
    customer_login_type VARCHAR(50),
    product_category VARCHAR(150),
    product VARCHAR(255),
    sales DECIMAL(12,2),
    quantity INT,
    discount DECIMAL(6,2),
    profit DECIMAL(12,2),
    shipping_cost DECIMAL(10,2),
    order_priority VARCHAR(30),
    payment_method VARCHAR(50)
);

