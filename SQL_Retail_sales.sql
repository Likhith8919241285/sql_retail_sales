CREATE DATABASE may;
use may;

CREATE TABLE pen (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(20),
    quantity INT,  -- Fixed typo here: "quantiy" ➝ "quantity"
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

-- View the table
SELECT COUNT(*) FROM pen;
-- LIMIT 10;

SELECT * FROM pen
WHERE
	transactions_id is NULL
    OR
	sale_date IS NULL
    OR
    sale_time is NULL
    OR
    customer_id is NULL
    OR
    gender is NULL
    OR 
    age is NULL
    OR 
    category is NULL
    OR
	total_sale is NULL
    OR
    quantity is NULL
    OR 
    price_per_unit is NULL
    OR
    cogs is NULL;
    
	                                            -- BASIC DATA ANALYSIS
	
    -- How many Sales do we have ?
    SELECT COUNT(*) FROM pen;
    
    -- How many total and unique Customers do we have?
    SELECT COUNT(distinct customer_id) AS Total_people FROM pen;
									
												-- GOOD DATA ANALYSIS
                                                
	-- 1. Write a SQL query to retrieve all columns for the sales '2022-11-05'
    -- 2.  Write a SQL query to retrieve all transactions where the category is 'Clothing' and the 
    -- quantity sold is more than 3 in the month of Nov-2022.
    -- 3. Write a SQL query to calculate the total sales (total_sale) for each category.
    -- 4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
    -- 5. Write a SQL query to find all transactions where the total_sale is greater than 1000.
    -- 6. Write a SQL query to find the total number of transactions (transactions_id) made by each gender in each category.
    -- 7. Write a SQL query to calculate the average sale for each month. Find out the best selling month in each year.
    -- 8. Write a SQL query to find the top 5 customers based on the highest total sales.
    -- 9. Write a SQL query to find the number of unique customers who purchased items from each category.
    -- 10. Write a SQL query to create each shift and number of orders
    -- Example:
			-- Morning ≤ 12
			-- Afternoon Between 12 & 17
			-- Evening > 17
            
	-- 1. 
    SELECT * FROM pen
    WHERE sale_date = '2022-11-05';
    
    -- 2. 
    SELECT * FROM pen
	WHERE category = 'Clothing'
    AND sale_date >= '2022-11-01'
	AND sale_date < '2022-12-01';
    
    -- There is a small error while saving excel sheet 'quantity is by mistakely written as quantiy'

    -- 3.
    SELECT category, SUM(total_sale) FROM pen
    group by 1;
	
    -- 4. 
    
    SELECT AVG(age) FROM pen
    WHERE category = 'Beauty';
    
    -- 5. 
    SELECT * FROM PEN
    WHERE total_sale > 1000;
    
    -- 6. 
    SELECT gender, category, count(transactions_id) AS transaction FROM pen
    group by gender,category;
    
    -- 7. 	
    -- i)
    SELECT extract(year from sale_date) AS year, extract(month from sale_date) AS month , AVG(total_sale) AS avg_sale from pen
    group by 1,2;
    
    -- ii) 
    SELECT extract(year from sale_date) AS year, extract(month from sale_date) AS month, SUM(total_sale) AS total from pen
    group by 1,2 
    ORDER BY 3 DESC;
    
    -- 8. 
    SELECT customer_id,total_sale AS Total FROM pen
    Group by 1,2
    ORDER BY 2 DESC
    LIMIT 5;
    
    -- 9. 
    SELECT COUNT(distinct customer_id) AS Customers, category FROM pen
    group by category;
    
    
      -- 10. Write a SQL query to create each shift and number of orders
    -- Example:
			-- Morning ≤ 12
			-- Afternoon Between 12 & 17
			-- Evening > 17
            
		SELECT *, 
			CASE
             WHEN EXTRACT(hour from sale_time) < 12 THEN 'Morning'
             WHEN EXTRACT(hour from sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
             ELSE 'Evening'
			END AS shift
             from pen;
             
        
            
		
    
    


    
    
    
    
                                                

    
    


