Walmart-Sales-Data-Analysis--SQL-Project
About
We are analyzing Walmart's sales data to identify high-performing branches and products, analyze the sales patterns of various products, and understand customer behavior. The primary objective is to enhance and optimize sales strategies. The dataset utilized in this project is sourced from the Kaggle Walmart Sales Forecasting Competition.

Purposes of the Project
The main goal of this project is to gain an understanding of Walmart's sales data, exploring the various factors that influence sales across different branches.

About Data
This project's data was obtained from the Kaggle Walmart Sales Forecasting Competition and it encompasses sales transactions from three Walmart branches in Mandalay, Yangon, and Naypyitaw, respectively. The data contains 17 columns and 1000 rows:


Analysis List:
Product Analysis
Perform an analysis of the data to gain insights into different product lines, determine the top-performing product lines, and identify areas for improvement in other product lines.

Sales Analysis
The objective of this analysis is to address the inquiry regarding the sales trends of the product. The outcomes of this analysis can assist in evaluating the efficiency of each applied sales strategy in the business and determining necessary modifications to increase sales.

Customer Analysis
This analysis is focused on identifying various customer segments, understanding purchasing trends, and evaluating the profitability associated with each of these customer segments.

Approach Used
Data Wrangling

During this initial phase, the data is examined to detect any NULL or missing values, and strategies for data replacement are implemented to address and substitute these values effectively.

Build a database
Create a table and insert the data.
Select columns with null values in them. Null values are not present in our database because, in creating the tables, NOT NULL was specified for each field, effectively filtering out any null values.

Exploratory Data Analysis (EDA)

I think conducting exploratory data analysis is essential to address the project's listed questions and objectives.

Business Questions to Answer
Generic Questions
How many distinct cities are present in the dataset?
In which city is each branch situated?
Product Analysis
How many distinct product lines are there in the dataset?
What is the most common payment method?
What is the most selling product line?
What is the total revenue by month?
Which month recorded the highest Cost of Goods Sold (COGS)?
Which product line generated the highest revenue?
Which city has the highest revenue?
Which product line incurred the highest VAT?
Retrieve each product line and add a column product_category, indicating 'Good' or 'Bad,' based on whether its sales are above the average.
Which branch sold more products than the average product sold?
What is the most common product line by gender?
What is the average rating of each product line?
Sales Analysis
Number of sales made at each time of the day per weekday
Identify the customer type that generates the highest revenue.
Which city has the largest tax percentage/ VAT (Value Added Tax)?
Which customer type pays the most VAT?
Customer Analysis
How many unique customer types does the data have?
How many unique payment methods does the data have?
Which is the most common customer type?
Which customer type buys the most?
What is the gender of most of the customers?
What is the gender distribution per branch?
Which time of the day do customers give the most ratings?
Which time of the day do customers give the most ratings per branch?
Which day of the week has the best average ratings?
Which day of the week has the best average ratings per branch?
