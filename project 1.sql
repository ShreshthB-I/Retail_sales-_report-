create database projet_1
CREATE TABLE Project( 
transactions_id INT primary key ,	
sale_date Date,
sale_time Time,	
customer_id INT,	
gender	VARCHAR (15),
age	INT,
category VARCHAR(15),
quantiy	INT,
price_per_unit FLOAT,
cogs FLOAT,
total_sale FLOAT 
);
select * from project
limit 10 
--- DATA CLEANING 
SELECT * from project 
WHERE Transactions_id is NULL

SELECT * from project 
WHERE sale_date is NULL 

SELECT * from project 
WHERE sale_time is NULL

SELECT * from project 
WHERE customer_id is NULL
OR
gender is NULL
OR
category is NULL
OR
quantiy is NULL
OR
price_per_unit is NULL
OR
cogs is NULL
OR
total_sale is NULL

--- DATA ANALYSIS & FINDING

---Write a SQL query to retrieve all columns for sales made on 2022-11-05

SELECT * FROM PROJECT 
 WHERE sale_date = '2022-11-05';
 
---Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov

SELECT  * FROM PROJECT
WHERE 
    category = 'Clothing'
    AND 
    TO CHAR Sale_date, 'YYYY-MM' = 2022-11
    AND
    quantity >= 4
    
    SELECT 
  *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND 
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantity >= 4
    
    
    SELECT 
  *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND 
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantity >= 4
    
    
SELECT 
  *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND 
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantity >= 4
    
---Write a SQL query to calculate the total sales (total_sale) for each category
    
    SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM PROJECT
GROUP BY 1
    

---Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category

SELECT
    ROUND(AVG(age), 2) as avg_age
FROM PROJECT
WHERE category = 'Beauty' 

---Write a SQL query to find all transactions where the total_sale is greater than 1000

SELECT * FROM project 
WHERE total_sale > 1000

---Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category

SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM project 
GROUP 
    BY 
    category,
    gender
ORDER BY 1

---Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT * FROM 
(    
SELECT 
    YEAR FROM sale_date,
    MONTH FROM sale_date,
    AVG total_sale as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM project 
GROUP BY 1, 2
) as 
WHERE rank = 1

---Write a SQL query to find the top 5 customers based on the highest total sales

SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM project 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

---Write a SQL query to find the number of unique customers who purchased items from each category

SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM project 
GROUP BY category

---Write a SQL query to create each shift and number of orders

WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM project
)
SELECT * 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift

--- End of projeect 