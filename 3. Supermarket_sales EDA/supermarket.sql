-- . Exploratory Data Analysis (EDA) : Univariate, Bivariate and Multivariate Using MySQL
USE supermarket_db;
SELECT * FROM supermarket_sales ss ;

-- Display the first 5 rows of the dataset
SELECT  * FROM supermarket_sales ss LIMIT 5;

-- Display the Last 5 rows of the dataset
SELECT  * FROM supermarket_sales ss ORDER BY `Invoice ID` DESC LIMIT 5;

-- Display Random 5 rows of the dataset
--  Using random function in the order by, we will get random data on every execution.
SELECT * FROM supermarket_sales ss ORDER BY RAND() LIMIT 5 ; 

-- Display count, min , max, avg and std values for a column in the dataset.
-- Univariate Analysis - Analysis without considering relationship with other variables.
SELECT COUNT(`gross income`),
MIN(`gross income`),
MAX(`gross income`),
AVG(`gross income`),
STD(`gross income`)
FROM supermarket_sales ss ;

-- find the number of missing values.
SELECT COUNT(*) FROM supermarket_sales ss WHERE Branch  is NULL ;
SELECT COUNT(*) FROM supermarket_sales ss WHERE ss.City  is NULL ;

-- Count the number of occurences of each city.
SELECT City ,COUNT(City) FROM supermarket_sales ss GROUP BY City  ;

-- Find the most frequently used payment method

SELECT Payment , COUNT(Payment) AS Count_Payment  FROM supermarket_sales ss GROUP BY Payment ORDER BY Count_Payment DESC ;


--  Does the cost of Goods sold affect the ratings that the customer provided.
-- Apply Bivariate and Multivariate analysis.

SELECT Rating, cogs  FROM supermarket_sales ss;

-- Find the most profitable branch as per gross income.

SELECT Branch , ROUND(SUM(`gross income`),2) AS "Sum_Gross_Income"  FROM supermarket_sales ss GROUP BY Branch ORDER BY Sum_Gross_Income DESC ;

-- Apply Multivariate analysis on the above query.
SELECT City ,Branch , SUM(`gross income`) FROM supermarket_sales ss GROUP BY City, Branch  ; 

-- Find the most used payment method city wise.

SELECT City,
	SUM(CASE WHEN Payment = 'Cash' THEN 1 ELSE 0 END) AS "Cash",
	SUM(CASE WHEN Payment = 'Ewallet' THEN 1 ELSE 0 END) AS "EWallet",
	SUM(CASE WHEN Payment = 'Credit card' THEN 1 ELSE 0 END) AS "Credit Card"
FROM supermarket_sales ss GROUP BY City ;

-- Find the product line purchased in highest quantity
SELECT  `Product line`, SUM(Quantity)  FROM supermarket_sales ss  GROUP BY `Product line` ORDER BY SUM(Quantity) DESC ;

-- Display Daily Sales by Day of the Week

SELECT * FROM supermarket_sales ss ;
--  In the given case Date column contain date in string format, converting first into date format

UPDATE supermarket_sales SET `Date` = STR_TO_DATE(`Date` , '%c/%e/%Y');

SELECT DAYNAME(date),DAYOFWEEK(Date) , SUM(Total) FROM supermarket_sales ss GROUP BY DAYNAME(`Date`), DAYOFWEEK(Date)  ORDER BY SUM(Total) DESC;

-- Find the Month with Highest Sale

SELECT MONTHNAME(`Date`) AS "Month", SUM(Total) AS "Sales" FROM supermarket_sales ss GROUP BY MONTHNAME(`Date`) ORDER BY SUM(TOTAL) DESC;

--  Find the time at which the sales are highest.
SELECT HOUR(`Time`) AS HOUR, SUM(Total)  FROM  supermarket_sales ss GROUP BY HOUR(`Time`) ORDER BY SUM(Total) DESC ; ;

-- Which gender spends more than the average
SELECT Gender , AVG(`gross income`)  FROM supermarket_sales ss GROUP BY Gender  ;








