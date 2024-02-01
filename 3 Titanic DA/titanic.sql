-- Titanic Database

SHOW DATABASES;
USE titanic_db;
SHOW TABLES;
SELECT * FROM titanic t ;
-- First 10 Rows of Dataset
SELECT * FROM titanic t LIMIT 10;
SELECT * FROM titanic t order by PassengerId DESC LIMIT 10;

-- Number of Passenger who survived
SELECT COUNT(*) AS "Passenger Survived" FROM titanic t WHERE Survived =1;

-- Find the Average age of all passenger
SELECT AVG(Age) AS "Average Age"  FROM titanic t ; 

-- Find the number of Passenger in each class.
SELECT Pclass , COUNT(*) AS "No. of Passenger" FROM titanic t GROUP BY Pclass ORDER BY Pclass ASC ;

-- Find the first 10 rows of the dataset sorted by passenger class in descending order.
SELECT * FROM titanic t ORDER BY Pclass DESC LIMIT 10; 

-- Find the Number of passengers in each class sorted by class in ascending order.

SELECT  Pclass AS "Class", COUNT(*) AS "No. of Passenger"  FROM titanic t GROUP BY Pclass ORDER BY Pclass ASC  ;

-- Find Average fare paid by passenger in each class.
SELECT Pclass , AVG(Fare) AS "Average Fare" FROM titanic t GROUP BY Pclass ORDER BY Pclass ASC ;

-- Find the name of the passenger with the Highest Fare
SELECT Name, Fare  FROM titanic t WHERE Fare  = (SELECT  MAX(Fare) from titanic t );

-- Find the name of the passenger who had the highest age among the survivors.

SELECT name, Age  FROM titanic t WHERE Age = (SELECT MAX(Age) FROM titanic t2 WHERE Survived=1) AND Survived =1;

-- Find the number of passenger who paid more than the average fare.
SELECT COUNT(*) AS "No. of Passenger" FROM titanic t WHERE Fare > (SELECT AVG(Fare) FROM titanic t2);

-- Find the name of the passenger who had the most parents or children on board.

SELECT Name , Parch  FROM titanic t WHERE t.Parch = (SELECT MAX(Parch) FROM titanic t2) ;

-- Find the No. of male and female passenger who survived, and order the result by sex in ascending order.
SELECT * FROM titanic t ;

SELECT Sex ,COUNT(*) AS "Survivor"  FROM titanic t WHERE Survived =1
GROUP BY Sex 
ORDER BY Sex ASC;

-- Find the name, age and fare of the oldest passenger who survived.
SELECT Name ,Age ,Fare  FROM titanic t WHERE Age = (SELECT MAX(Age) FROM titanic t2 WHERE Survived=1);

-- Find the name and age of the youngest female passenger who survived in third class
SELECT Name, Age FROM titanic t WHERE Sex ='female' and Pclass =3 and Survived =1 and Age = (SELECT MIN(Age) FROM titanic t2 WHERE Sex ='female' AND t.Survived =1 AND Pclass =3 );

-- Find the Number of Male and Female passenger using case statement

SELECT  
SUM(CASE WHEN Sex ='male' THEN 1 else 0 end) AS "Num_Male",
SUM(CASE WHEN Sex = 'female' THEN 1 else 0 end) AS "Num_Female"
FROM titanic t;

-- Select all passenger who travelled in a cabin that was not shared by other passenger.
SELECT * FROM titanic t WHERE Cabin NOT IN (SELECT Cabin FROM titanic t GROUP BY Cabin HAVING COUNT(*) > 1);
 























