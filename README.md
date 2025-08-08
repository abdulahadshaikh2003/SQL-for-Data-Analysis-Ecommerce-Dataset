# Task 4: SQL for Data Analysis – Ecommerce Dataset

## Objective
Use SQL (MySQL) to extract, clean, and analyze an Ecommerce dataset to produce business insights and deliver SQL queries & screenshots.

## Dataset
Source : https://www.kaggle.com/datasets/mervemenekse/ecommerce-dataset
Columns:
Order_Date, Time, Aging, Customer_Id, Gender, Device_Type, Customer_Login_type,
Product_Category, Product, Sales, Quantity, Discount, Profit, Shipping_Cost,
Order_Priority, Payment_method

## Tools
- MySQL Server (8+)
- MySQL Workbench
- GitHub for submission

## Deliverables
- `task4_queries.sql` — SQL file containing create table, cleaning steps, analysis queries, views, and index creation.
- `screenshots/` — Query output screenshots (PNG)
- `README.md` — Project description (this file)

## Key Query Examples
- Total Sales: `SELECT SUM(sales) FROM orders_raw;`
- Sales by category: `SELECT product_category, SUM(sales) ... GROUP BY product_category;`
- Average revenue per user: `SELECT AVG(total_spent) FROM (SELECT customer_id, SUM(sales)...) t;`
- View for monthly summary: `CREATE VIEW vw_monthly_sales AS ...`

## How to run
1. Import `ecommerce_data.csv` into MySQL table `orders_raw` (see `task4_queries.sql`).
2. Run the queries in `task4_queries.sql` via MySQL Workbench or command line.

## Contact
Prepared by: **Abdul Ahad Shaikh**
Elevate Labs – Data Analyst Internship

4. Export query results and save screenshots.

