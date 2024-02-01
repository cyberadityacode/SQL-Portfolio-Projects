## SQL Portfolio Project - Titanic DA

- The provided SQL queries analyze the Titanic dataset, aiming to extract valuable insights and statistics from passenger records. This dataset represents information about individuals who were aboard the Titanic, including details such as survival status, age, gender, class, and fare paid. 

- The queries cover a range of topics, including basic dataset exploration, survival statistics, demographic information, and specific scenarios such as finding passengers with the highest fare, oldest survivors, and those with unique cabin situations. 

- Each query delves into different aspects of the dataset, contributing to a comprehensive understanding of the characteristics and experiences of Titanic passengers.

1. **Show Databases:**
   ```sql
   SHOW DATABASES;
   ```

2. **Use Titanic Database:**
   ```sql
   USE titanic_db;
   ```

3. **Show Tables:**
   ```sql
   SHOW TABLES;
   ```

4. **Select All from Titanic Table:**
   ```sql
   SELECT * FROM titanic t;
   ```

5. **Select First 10 Rows from Titanic Table:**
   ```sql
   SELECT * FROM titanic t LIMIT 10;
   ```

6. **Select Last 10 Rows from Titanic Table:**
   ```sql
   SELECT * FROM titanic t ORDER BY PassengerId DESC LIMIT 10;
   ```

7. **Number of Passengers who Survived:**
   ```sql
   SELECT COUNT(*) AS "Passenger Survived" FROM titanic t WHERE Survived = 1;
   ```

8. **Average Age of All Passengers:**
   ```sql
   SELECT AVG(Age) AS "Average Age" FROM titanic t;
   ```

9. **Number of Passengers in Each Class:**
   ```sql
   SELECT Pclass, COUNT(*) AS "No. of Passengers" FROM titanic t GROUP BY Pclass ORDER BY Pclass ASC;
   ```

10. **First 10 Rows Sorted by Passenger Class in Descending Order:**
    ```sql
    SELECT * FROM titanic t ORDER BY Pclass DESC LIMIT 10;
    ```

11. **Number of Passengers in Each Class Sorted by Class in Ascending Order:**
    ```sql
    SELECT Pclass AS "Class", COUNT(*) AS "No. of Passengers" FROM titanic t GROUP BY Pclass ORDER BY Pclass ASC;
    ```

12. **Average Fare Paid by Passengers in Each Class:**
    ```sql
    SELECT Pclass, AVG(Fare) AS "Average Fare" FROM titanic t GROUP BY Pclass ORDER BY Pclass ASC;
    ```

13. **Name of Passenger with Highest Fare:**
    ```sql
    SELECT Name, Fare FROM titanic t WHERE Fare = (SELECT MAX(Fare) FROM titanic t);
    ```

14. **Name of the Oldest Survivor:**
    ```sql
    SELECT Name, Age FROM titanic t WHERE Age = (SELECT MAX(Age) FROM titanic t2 WHERE Survived = 1) AND Survived = 1;
    ```

15. **Number of Passengers Who Paid More Than Average Fare:**
    ```sql
    SELECT COUNT(*) AS "No. of Passengers" FROM titanic t WHERE Fare > (SELECT AVG(Fare) FROM titanic t2);
    ```

16. **Name of Passenger with Most Parents or Children on Board:**
    ```sql
    SELECT Name, Parch FROM titanic t WHERE t.Parch = (SELECT MAX(Parch) FROM titanic t2);
    ```

17. **Number of Male and Female Passengers Who Survived:**
    ```sql
    SELECT Sex, COUNT(*) AS "Survivor" FROM titanic t WHERE Survived = 1 GROUP BY Sex ORDER BY Sex ASC;
    ```

18. **Name, Age, and Fare of the Oldest Survivor:**
    ```sql
    SELECT Name, Age, Fare FROM titanic t WHERE Age = (SELECT MAX(Age) FROM titanic t2 WHERE Survived = 1);
    ```

19. **Name and Age of Youngest Female Passenger Who Survived in Third Class:**
    ```sql
    SELECT Name, Age FROM titanic t WHERE Sex = 'female' AND Pclass = 3 AND Survived = 1 AND Age = (SELECT MIN(Age) FROM titanic t2 WHERE Sex = 'female' AND t.Survived = 1 AND Pclass = 3);
    ```

20. **Number of Male and Female Passengers Using CASE Statement:**
    ```sql
    SELECT
        SUM(CASE WHEN Sex = 'male' THEN 1 ELSE 0 END) AS "Num_Male",
        SUM(CASE WHEN Sex = 'female' THEN 1 ELSE 0 END) AS "Num_Female"
    FROM titanic t;
    ```

21. **Passengers with Non-Shared Cabins:**
    ```sql
    SELECT * FROM titanic t WHERE Cabin NOT IN (SELECT Cabin FROM titanic t GROUP BY Cabin HAVING COUNT(*) > 1);
    ```

