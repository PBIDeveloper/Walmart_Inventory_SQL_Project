
/* 

   Author - Akshay Kalamkar
   Dataset - Wallmart Sales

*/

USE Wallmart;

select * from Wallmart


-- Time_of_day

SELECT time,
(CASE 
	WHEN Time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
	WHEN Time BETWEEN '12:01:00' AND '6:00:00' THEN 'Afternoon'
	ELSE 'Evening' 
END) AS time_of_day
FROM Wallmart;

ALTER TABLE Wallmart 
ADD time_of_day VARCHAR(20);

UPDATE Wallmart
SET time_of_day = (
   CASE 
	WHEN Time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
	WHEN Time BETWEEN '12:01:00' AND '6:00:00' THEN 'Afternoon'
	ELSE 'Evening' 
END
);


2.Day_name

SELECT date,
DATENAME(dw, date) AS day_name
FROM wallmart;


ALTER TABLE Wallmart ADD day_name VARCHAR(10);

UPDATE Wallmart
SET day_name = DATENAME(dw,date);

3.Momth_name

SELECT date,
DATENAME(month, date) AS month_name
FROM Wallmart;


ALTER TABLE wallmart ADD month_name VARCHAR(10);

UPDATE Wallmart
SET month_name = DATENAME(month,date);


----------------Exploratory Data Analysis (EDA)----------------------


--Generic Questions
-- 1.How many distinct cities are present in the dataset?

SELECT DISTINCT city FROM Wallmart;

-- 2.In which city is each branch situated?
SELECT DISTINCT branch, city FROM Wallmart;

--Product Analysis
-- 1.How many distinct product lines are there in the dataset?
SELECT COUNT(DISTINCT product_line) AS PL FROM Wallmart;

-- 2.What is the most common payment method?
SELECT TOP 1 payment, COUNT(payment) AS common_payment_method 
FROM Wallmart GROUP BY payment 
ORDER BY common_payment_method DESC;

-- 3.What is the most selling product line?
SELECT TOP 1 product_line, count(product_Line) AS most_selling_product
FROM Wallmart GROUP BY product_line 
ORDER BY most_selling_product DESC;

-- 4.What is the total revenue by month?
SELECT month_name, SUM(total) AS total_revenue
FROM Wallmart GROUP BY month_name 
ORDER BY total_revenue DESC;

-- 5.Which month recorded the highest Cost of Goods Sold (COGS)?
SELECT month_name, SUM(cogs) AS total_cogs
FROM Wallmart GROUP BY month_name 
ORDER BY total_cogs DESC;

-- 6.Which product line generated the highest revenue?
SELECT top 1 product_line, SUM(total) AS total_revenue
FROM Wallmart GROUP BY product_line 
ORDER BY total_revenue DESC;

-- 7.Which city has the highest revenue?
SELECT Top 1 city, SUM(total) AS total_revenue
FROM Wallmart GROUP BY city 
ORDER BY total_revenue DESC;


-- 9.Retrieve each product line and add a column product_category, indicating 'Good' or 'Bad,'based on whether its sales are above the average.

ALTER TABLE wallmart ADD 
product_category VARCHAR(20);

UPDATE Wallmart 
SET product_category= 
(CASE 
	WHEN total >= (SELECT AVG(total) FROM Wallmart) THEN 'Good'
    ELSE 'Bad'
END)FROM Wallmart;

-- 10.Which branch sold more products than average product sold?
SELECT top 1  branch, SUM(quantity) AS quantity
FROM Wallmart GROUP BY branch 
HAVING SUM(quantity) > AVG(quantity) ORDER BY quantity DESC ;

-- 11.What is the most common product line by gender?
SELECT gender, product_line, COUNT(gender) total_count
FROM wallmart GROUP BY gender, product_line 
ORDER BY total_count DESC;

-- 12.What is the average rating of each product line?
SELECT product_line, ROUND(AVG(rating),2) average_rating
FROM wallmart GROUP BY product_line ORDER BY average_rating DESC;

select * from Wallmart
--Sales Analysis
-- 1.Number of sales made in each time of the day per weekday
SELECT day_name, time_of_day, COUNT(invoice_id) AS total_sales
FROM Wallmart 
where day_name NOT IN ('Sunday','Saturday')
GROUP BY day_name, time_of_day ;

SELECT day_name, time_of_day, COUNT(*) AS total_sales
FROM Wallmart WHERE day_name NOT IN ('Saturday','Sunday') 
GROUP BY day_name, time_of_day;

-- 2.Identify the customer type that generates the highest revenue.
SELECT customer_type, SUM(total) AS total_sales
FROM Wallmart GROUP BY customer_type ORDER BY total_sales DESC;

--Customer Analysis

-- 1.How many unique customer types does the data have?
SELECT COUNT(DISTINCT customer_type) FROM Wallmart;

-- 2.How many unique payment methods does the data have?
SELECT COUNT(DISTINCT payment)as UPM FROM Wallmart;

-- 3.Which is the most common customer type?
SELECT TOP 1 customer_type, COUNT(customer_type) AS common_customer
FROM Wallmart 
GROUP BY customer_type 
ORDER BY common_customer DESC;

-- 4.Which customer type buys the most?
SELECT TOP 1 customer_type, SUM(total) as total_sales
FROM Wallmart 
GROUP BY customer_type 
ORDER BY total_sales;

SELECT TOP 1 customer_type, COUNT(*) AS most_buyer
FROM Wallmart 
GROUP BY customer_type 
ORDER BY most_buyer DESc;

-- 5.What is the gender of most of the customers?
SELECT TOP 1 gender, COUNT(*) AS all_genders 
FROM wallmart 
GROUP BY gender 
ORDER BY all_genders DESC;

-- 6.What is the gender distribution per branch?
SELECT branch, gender, COUNT(gender) AS gender_distribution
FROM Wallmart 
GROUP BY branch, gender 
ORDER BY branch;

-- 7.Which time of the day do customers give most ratings?
SELECT TOP 1 time_of_day, AVG(rating) AS average_rating
FROM Wallmart 
GROUP BY time_of_day 
ORDER BY average_rating DESC;

-- 8.Which time of the day do customers give most ratings per branch?
SELECT branch, time_of_day, AVG(rating) AS average_rating
FROM Wallmart 
GROUP BY branch, time_of_day 
ORDER BY average_rating DESC;


-- 9.Which day of the week has the best avg ratings?
SELECT TOP 1 day_name, AVG(rating) AS average_rating
FROM Wallmart GROUP BY day_name 
ORDER BY average_rating DESC;

-- 10.Which day of the week has the best average ratings per branch?
SELECT  branch, day_name, AVG(rating) AS average_rating
FROM Wallmart GROUP BY day_name, branch 
ORDER BY average_rating DESC;
