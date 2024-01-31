# SQL-Portfolio-Projects
Comprises SQL Portfolio Projects using CSV Datasets and SQL Query
Certainly! Here's a Data Analytics Report based on the provided SQL queries:


## Project Summary: Employee Salaries Data Analysis

**Introduction:**

This data analysis project centers around exploring and deriving valuable insights from an employee salaries dataset stored in the 'Salaries' table within the 'database_sal' database. The dataset encompasses a comprehensive set of attributes, including employee names, job titles, base pay, overtime pay, and total pay benefits. The primary goal of this analysis is to uncover patterns, trends, and relevant information that can inform decision-making processes within the organization.

**Dataset Overview:**

The 'Salaries' table serves as a comprehensive repository of information about the organization's workforce, offering insights into the compensation structures, job roles, and various financial components associated with each employee. Through SQL queries, we aim to extract meaningful information to facilitate a deeper understanding of the organization's payroll dynamics.

**Key Objectives:**

1. **Exploratory Data Analysis:** Gain a comprehensive overview of the dataset by examining all rows and columns within the 'Salaries' table.

2. **Employee Demographics:** Investigate employee names and job titles to understand the composition and distribution of job roles within the organization.

3. **Organizational Size:** Determine the total number of employees in the organization.

4. **Job Title Analysis:** Identify unique job titles, exploring the diversity of roles within the organization.

5. **Compensation Insights:** Analyze aspects of compensation, such as overtime pay, base pay, and total pay benefits, to uncover trends and outliers.

6. **Top Performers:** Recognize the top 10 highest-paid employees and investigate the second-highest salary within the organization.

7. **Performance Metrics:** Calculate and analyze the average base pay and explore the average of base pay, overtime pay, and other pay for each employee.

8. **Job Title Specifics:** Investigate employees with specific job titles, including those containing or excluding the term "Manager."

9. **Salary Range Analysis:** Explore employees falling within specific salary ranges.

10. **Data Modification and Cleanup:** Implement changes to the dataset, such as deleting a column, updating base pay for certain roles, and removing employees with no overtime pay.

Through this data analysis project, we aim to provide a comprehensive understanding of the organization's employee salaries data. The insights derived will contribute to informed decision-making processes, potentially guiding future strategies related to compensation, workforce distribution, and overall organizational efficiency.

---

## Data Analytics Report

### 1. Overview

The dataset is from the 'Salaries' table within the 'database_sal' database. It contains information about employee salaries, job titles, and other related details.

### 2. All Rows and Columns

The entire dataset contains various columns providing detailed information about each employee.

```sql
SELECT * FROM Salaries;
```

### 3. Employee Name and Job Title

Viewing the names and job titles of all employees:

```sql
SELECT EmployeeName, JobTitle FROM Salaries;
```

### 4. Number of Employees in the Organization

Calculating the total number of employees in the organization:

```sql
SELECT COUNT(*) FROM Salaries;
```

### 5. Unique Job Titles

Identifying unique job titles within the organization:

```sql
SELECT COUNT(DISTINCT JobTitle) FROM Salaries;
```

### 6. Job Title and Overtime Pay

Displaying job titles and overtime pay for employees with overtime pay greater than $50,000:

```sql
SELECT JobTitle, OvertimePay FROM Salaries WHERE OvertimePay > 50000;
```

### 7. Average Base Pay

Calculating the average base pay of all employees:

```sql
SELECT AVG(BasePay) AS "Average Base Pay" FROM Salaries;
```

### 8. Top 10 Highest Paid Employees

Listing the top 10 highest-paid employees:

```sql
SELECT EmployeeName, TotalPay FROM Salaries ORDER BY TotalPay DESC LIMIT 10;
```

### 9. Second Highest Salary

Identifying the second-highest salary and the respective employee:

```sql
SELECT EmployeeName, TotalPay FROM Salaries ORDER BY TotalPay DESC LIMIT 1 OFFSET 1;
```

### 10. Average of Base Pay, Overtime Pay, and Other Pay

Calculating the average of base pay, overtime pay, and other pay for each employee:

```sql
SELECT EmployeeName, (BasePay + OvertimePay + OtherPay) / 3 AS "Average of BP-OverP-OP" FROM Salaries;
```

### 11. Employees with "Manager" in Job Title

Finding all employees with the word "Manager" in their job title:

```sql
SELECT EmployeeName, JobTitle FROM Salaries WHERE JobTitle LIKE "%Manager%";
```

### 12. Employees without "Manager" in Job Title

Finding all employees without the word "Manager" in their job title:

```sql
SELECT EmployeeName, JobTitle FROM Salaries WHERE JobTitle NOT LIKE "%Manager%";
```

### 13. Employees with Total Pay between $50,000 and $75,000

Identifying employees with total pay between $50,000 and $75,000:

```sql
SELECT * FROM Salaries WHERE TotalPay BETWEEN 50000 AND 75000;
```

### 14. Employees with Base Pay less than $50,000 or Total Pay greater than $100,000

Finding employees with base pay less than $50,000 or total pay greater than $100,000:

```sql
SELECT * FROM Salaries WHERE BasePay < 50000 OR TotalPay > 100000;
```

### 15. Employees with Total Pay Benefits between $125,000 and $150,000 and Job Title containing "Director"

Finding employees with total pay benefits between $125,000 and $150,000 and a job title containing the word "Director":

```sql
SELECT * FROM Salaries WHERE TotalPayBenefits BETWEEN 125000 AND 150000 AND JobTitle LIKE "%Director%";
```

### 16. Employees Ordered by Total Pay Benefits in Descending Order

Listing all employees ordered by their total pay benefits in descending order:

```sql
SELECT * FROM Salaries ORDER BY TotalPayBenefits DESC;
```

### 17. Job Titles with Average Base Pay of at Least $100,000

Listing job titles with an average base pay of at least $100,000, ordered by the average base pay in descending order:

```sql
SELECT JobTitle, AVG(BasePay) AS "Average Base Pay"
FROM Salaries
GROUP BY JobTitle
HAVING AVG(BasePay) >= 100000
ORDER BY "Average Base Pay" DESC;
```

### 18. Deleting a Column - Notes

```sql
SELECT * FROM Salaries;
ALTER TABLE Salaries DROP COLUMN Notes;
```

### 19. Updating Base Pay of "Manager" Employees

Updating the base pay of all employees with the job title containing "Manager" by increasing it by 10%:

```sql
SELECT * FROM Salaries;
UPDATE Salaries SET BasePay = BasePay * 1.10 WHERE JobTitle LIKE "%Manager%";
```

### 20. Deleting Employees with No Overtime Pay

Identifying and deleting employees with no overtime pay:

```sql
SELECT COUNT(*) FROM Salaries WHERE OvertimePay = 0;
DELETE FROM Salaries WHERE OvertimePay = 0;
```

---

