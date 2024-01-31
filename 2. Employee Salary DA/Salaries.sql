use database_sal;
show tables;
-- Show All Rows and Columns in the table 
SELECT * from Salaries;

-- Employee Name and Job Title

SELECT EmployeeName , JobTitle  FROM Salaries s ;

-- How many Employees are there in organisation

SELECT COUNT(*) from Salaries s ;

-- Show unique job titles in the table

SELECT COUNT(DISTINCT JobTitle)  FROM Salaries s ;

-- Show Job Title and Overtime pay for all employee with overtime pay greater than 50000

SELECT JobTitle, OvertimePay from Salaries s WHERE OvertimePay > 50000;

-- Show Average Base Pay of all employees

SELECT * from Salaries s ;
SELECT AVG(BasePay) AS "Average Base Pay" from Salaries s ;

-- Select top 10 highest paid employees

SELECT EmployeeName , TotalPay  FROM Salaries s order by TotalPay DESC LIMIT 10;

-- SELECT Second Highest Salary of an employee with name
 
-- In SQL, the OFFSET clause is used in conjunction with the LIMIT clause to specify the number of rows to skip before starting to return rows from the result set. This is often used for pagination purposes or to skip a certain number of rows within a result set.
 

SELECT EmployeeName , TotalPay  FROM Salaries s order by TotalPay DESC LIMIT 1 OFFSET 1;

-- Show the average of Basepay, Overtime Pay and other Pay for each employee

SELECT EmployeeName , (BasePay+ OvertimePay+ OtherPay)/3 as "Average of BP-OverP-OP"
FROM Salaries s;

-- Show all employees who have the word "Manager" in their Job title.

SELECT EmployeeName, JobTitle  from Salaries s 
WHERE JobTitle LIKE "%Manager%";

-- Show all employees who do not have the word "Manager" in their Job title.

SELECT EmployeeName, JobTitle  from Salaries s 
WHERE JobTitle NOT LIKE "%Manager%";

--  Show all Employees with a total pay between 50,000 and 75,000
SELECT * from S alaries s WHERE  TotalPay BETWEEN 50000 and 75000 ;

--  Show all Employees with a base pay is less than 50k or a total pay greater than 100k

SELECT * from Salaries s WHERE BasePay < 50000 or TotalPay >100000;

-- Show all Employee with a total pay benifit value between 125k and 150k and a job title containing the word "Director"

SELECT * FROM Salaries s WHERE TotalPayBenefits BETWEEN 125000 and 150000 and s.JobTitle LIKE "%Director%" ;

-- Show all employees ordered by their total pay benifits in descending order

SELECT * FROM Salaries s ORDER BY  TotalPayBenefits DESC  ;

--  Show all Job Title with an average base pay of at Least 100,000 and order them by the average
--  base pay in descending order.

SELECT JobTitle, AVG(BasePay) as "Average Base Pay" FROM Salaries s GROUP BY JobTitle HAVING AVG(BasePay)>=100000 ORDER BY "Average Base Pay" DESC

-- Delete a Colomn - Notes

SELECT * FROM Salaries s ;
ALTER TABLE Salaries DROP COLUMN Notes;


-- Update the base pay of all employees with the Job Title containing "Manager" by increasing it by 10%
SELECT * FROM Salaries s ;
UPDATE Salaries 
SET BasePay = BasePay * 1.10
WHERE JobTitle LIKE "%Manager%";

-- Delete all employees who have no Overtime Pay

SELECT COUNT(*) FROM Salaries s WHERE OvertimePay =0;
DELETE FROM Salaries WHERE OvertimePay= 0;
















  




