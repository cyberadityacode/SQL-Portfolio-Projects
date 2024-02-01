# Data Analysis Report: Exploratory Data Analysis (EDA) in MySQL and Excel

## 1. Overview

The provided MySQL queries are aimed at conducting an exploratory data analysis (EDA) on the "supermarket_sales" dataset. The analysis covers univariate, bivariate, and multivariate aspects to gain insights into various aspects of the data.

## 2. Data Exploration

### 2.1 Basic Dataset Information
```sql
USE supermarket_db;
SELECT * FROM supermarket_sales ss;
```

### 2.2 Display First 5 Rows
```sql
SELECT * FROM supermarket_sales ss LIMIT 5;
```

### 2.3 Display Last 5 Rows
```sql
SELECT * FROM supermarket_sales ss ORDER BY `Invoice ID` DESC LIMIT 5;
```

### 2.4 Display Random 5 Rows
```sql
SELECT * FROM supermarket_sales ss ORDER BY RAND() LIMIT 5;
```

## 3. Univariate Analysis
- Univariate analysis involves examining and understanding the characteristics of a single variable, exploring its distribution, summary statistics, and patterns of variation in isolation. It provides insights into the behavior of a specific data point without considering relationships with other variables.

### 3.1 Descriptive Statistics for 'Gross Income'
```sql
SELECT COUNT(`gross income`), MIN(`gross income`), MAX(`gross income`), AVG(`gross income`), STD(`gross income`)
FROM supermarket_sales ss;
```

### 3.2 Missing Values
```sql
SELECT COUNT(*) FROM supermarket_sales ss WHERE Branch IS NULL;
SELECT COUNT(*) FROM supermarket_sales ss WHERE ss.City IS NULL;
```

### 3.3 City-wise Counts
```sql
SELECT City, COUNT(City) FROM supermarket_sales ss GROUP BY City;
```

### 3.4 Most Frequently Used Payment Method
```sql
SELECT Payment, COUNT(Payment) AS Count_Payment FROM supermarket_sales ss GROUP BY Payment ORDER BY Count_Payment DESC;
```

## 4. Bivariate and Multivariate Analysis
Bivariate analysis explores the relationship between two variables, examining how changes in one variable may relate to changes in another. Multivariate analysis extends this to three or more variables, allowing the study of complex interactions and dependencies among multiple factors simultaneously.

### 4.1 Relationship between 'Cost of Goods Sold (COGS)' and 'Customer Ratings'
```sql
SELECT Rating, cogs FROM supermarket_sales ss;
```

### 4.2 Most Profitable Branch
```sql
SELECT Branch, ROUND(SUM(`gross income`),2) AS "Sum_Gross_Income" FROM supermarket_sales ss GROUP BY Branch ORDER BY Sum_Gross_Income DESC;
```

### 4.3 Multivariate Analysis on Profitability (City-wise)
```sql
SELECT City, Branch, SUM(`gross income`) FROM supermarket_sales ss GROUP BY City, Branch;
```

### 4.4 Most Used Payment Method City-wise
```sql
SELECT City,
       SUM(CASE WHEN Payment = 'Cash' THEN 1 ELSE 0 END) AS "Cash",
       SUM(CASE WHEN Payment = 'Ewallet' THEN 1 ELSE 0 END) AS "EWallet",
       SUM(CASE WHEN Payment = 'Credit card' THEN 1 ELSE 0 END) AS "Credit Card"
FROM supermarket_sales ss GROUP BY City;
```

### 4.5 Product Line Purchased in Highest Quantity
```sql
SELECT `Product line`, SUM(Quantity) FROM supermarket_sales ss GROUP BY `Product line` ORDER BY SUM(Quantity) DESC;
```

## 5. Time Analysis

### 5.1 Daily Sales by Day of the Week
```sql
SELECT DAYNAME(`Date`), DAYOFWEEK(Date), SUM(Total) FROM supermarket_sales ss GROUP BY DAYNAME(`Date`), DAYOFWEEK(Date) ORDER BY SUM(Total) DESC;
```

### 5.2 Month with Highest Sale
```sql
SELECT MONTHNAME(`Date`) AS "Month", SUM(Total) AS "Sales" FROM supermarket_sales ss GROUP BY MONTHNAME(`Date`) ORDER BY SUM(TOTAL) DESC;
```

### 5.3 Time of Highest Sales
```sql
SELECT HOUR(`Time`) AS HOUR, SUM(Total) FROM supermarket_sales ss GROUP BY HOUR(`Time`) ORDER BY SUM(Total) DESC;
```

## 6. Gender Spending Analysis

### 6.1 Average Gross Income by Gender
```sql
SELECT Gender, AVG(`gross income`) FROM supermarket_sales ss GROUP BY Gender;
```

The provided SQL queries cover a comprehensive exploratory data analysis of the "supermarket_sales" dataset, examining various aspects such as descriptive statistics, missing values, city-wise analysis, payment methods, profitability, and time-related trends. The insights gained from these analyses can serve as a foundation for further investigations and business decision-making.
