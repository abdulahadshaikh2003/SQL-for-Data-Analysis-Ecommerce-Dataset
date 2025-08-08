-- First ensure your table structure allows NULLs for numeric fields
ALTER TABLE orders MODIFY Aging INT NULL;
ALTER TABLE orders MODIFY Quantity INT NULL;
ALTER TABLE orders MODIFY Discount DECIMAL(5,2) NULL;
ALTER TABLE orders MODIFY Profit DECIMAL(10,2) NULL;
ALTER TABLE orders MODIFY Shipping_Cost DECIMAL(5,2) NULL;

-- Run this comprehensive import command
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/E-commerce Dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS  -- Skip header row
(
  @Order_Date,
  @Time,
  @Aging,
  @Customer_Id,
  @Gender,
  @Device_Type,
  @Customer_Login_type,
  @Product_Category,
  @Product,
  @Sales,
  @Quantity,
  @Discount,
  @Profit,
  @Shipping_Cost,
  @Order_Priority,
  @Payment_method
)
SET 
  Order_Date = STR_TO_DATE(@Order_Date, '%d-%m-%Y'),
  Time = NULLIF(@Time, ''),
  Aging = NULLIF(@Aging, ''),
  Customer_Id = NULLIF(@Customer_Id, ''),
  Gender = NULLIF(@Gender, ''),
  Device_Type = NULLIF(@Device_Type, ''),
  Customer_Login_type = NULLIF(@Customer_Login_type, ''),
  Product_Category = NULLIF(@Product_Category, ''),
  Product = NULLIF(@Product, ''),
  Sales = NULLIF(@Sales, ''),
  Quantity = NULLIF(@Quantity, ''),
  Discount = NULLIF(@Discount, ''),
  Profit = NULLIF(@Profit, ''),
  Shipping_Cost = NULLIF(@Shipping_Cost, ''),
  Order_Priority = NULLIF(@Order_Priority, ''),
  Payment_method = NULLIF(@Payment_method, '');
  
 -- 1. Total number of orders
SELECT COUNT(*) AS total_orders FROM orders;

-- 2. Total sales and total profit
SELECT SUM(sales) AS total_sales, SUM(profit) AS total_profit FROM orders;

-- 3. Average sales per order
SELECT AVG(sales) AS avg_sales_per_order FROM orders;

-- 4. Sales by product category
SELECT product_category, SUM(sales) AS total_sales
FROM orders
GROUP BY product_category
ORDER BY total_sales DESC;

-- 5. Orders by payment method
SELECT payment_method, COUNT(*) AS total_orders
FROM orders
GROUP BY payment_method;

-- 6. Top 5 products by sales
SELECT product, SUM(sales) AS total_sales
FROM orders
GROUP BY product
ORDER BY total_sales DESC
LIMIT 5;

-- 7. Monthly sales trend
SELECT YEAR(order_date) AS year, MONTH(order_date) AS month, SUM(sales) AS monthly_sales
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- 8. Average profit by product category
SELECT product_category, AVG(profit) AS avg_profit
FROM orders
GROUP BY product_category
ORDER BY avg_profit DESC;
