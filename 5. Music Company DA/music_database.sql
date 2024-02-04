-- Music Database
use music_database;
show tables;

SELECT * from album a ;

-- Question 1- Who is the senior most employee based on the job title.

SELECT * FROM employee e ORDER BY levels DESC LIMIT 1;

-- Question 2 -  Which countries have the most invoices

SELECT billing_country , COUNT(invoice_id) AS "Total Invoices" 
FROM invoice i
GROUP BY billing_country 
ORDER BY "Total Invoices" DESC;

-- Question 3 - What are top 3 values of total invoice
SELECT total  
FROM invoice i 
ORDER BY total DESC
LIMIT 3;

-- Question 4 - Which city has the best customers? We would like to throw a 
-- promotional music festival in the city which made most money. Write a query
-- that return one city that has the highest sum of the invoice totals, 
-- return both the city name and sum of all invoice total.

SELECT billing_city , SUM(total) AS "Invoice Total"
FROM invoice i 
GROUP BY billing_city 
ORDER BY "Invoice Total" DESC 
LIMIT 1;

-- Question 5 - Who is the best customer? The customer who spent the most
-- money will be declared the best customer.Write a query that returns 
-- the person who has spent the most money.

SELECT c.customer_id ,c.first_name , c.last_name  , SUM(i.total) AS total
FROM customer c
JOIN invoice i 
ON c.customer_id = i.customer_id 
GROUP BY c.customer_id , c.first_name , c.last_name  
ORDER BY total DESC
LIMIT 1;

-- Question Set 2 - Moderate
-- Question 1 - Write a query to return the email, first name, last name & Genre
-- of all the rock music listeners. 
-- Return your list ordered alphabatically by email starting with letter A


SELECT DISTINCT email ,first_name ,last_name  
from customer c 
JOIN invoice i 
ON c.customer_id =i.customer_id 
JOIN invoice_line il 
ON il.invoice_id =i.invoice_id 
WHERE il.track_id IN 
(
	SELECT track_id from track t 
	JOIN  genre g ON t.genre_id = g.genre_id
	WHERE g.name LIKE 'Rock'
)
-- AND email like 'a%'
ORDER BY email; 

-- Question 2 - lets invite the artist who have written the most rock music
-- in our dataset. Write a query that return the artist name and total track count
-- of the top 10 rock band.

SELECT a.name  , count(alb.album_id) AS Total_Albums
from artist a 
join album alb
on a.artist_id =alb.artist_id 
join track t 
on t.album_id = alb.album_id 
WHERE t.genre_id = (SELECT genre_id from genre g WHERE g.name like 'Rock')
GROUP BY a.name
ORDER BY Total_Albums DESC
LIMIT 10;

-- 
-- Question 3 - Return the track name that have a song length longer than the average
-- song length. Return the name and milliseconds for each track. 
-- order by the song length with the longest songs listed first.

SELECT name , milliseconds  
FROM track t 
WHERE milliseconds > (
			SELECT AVG(milliseconds) 
			from track t2 
			) 
ORDER BY milliseconds  DESC 

-- Advance Level Questions
-- Question 1 - Find how much amount spent by each customer on artists?
-- Write a query to return customer name, artist name and total spent


WITH best_selling_artist AS (
    SELECT
        artist.artist_id AS artist_id,
        artist.name AS artist_name,
        SUM(il.unit_price * il.quantity) AS total_sales
    FROM
        invoice_line il
        JOIN track t ON t.track_id = il.track_id
        JOIN album alb ON alb.album_id = t.album_id
        JOIN artist ON artist.artist_id = alb.artist_id
    GROUP BY
        artist.artist_id, artist.name -- Include all non-aggregated columns
    ORDER BY
        total_sales DESC
    LIMIT 1
)
SELECT c.customer_id, c.first_name, c.last_name ,bsa.artist_name, 
SUM(il.unit_price* il.quantity) AS amount_spent
FROM invoice i
JOIN customer c on c.customer_id = i.customer_id 
JOIN invoice_line il on il.invoice_id  = i.invoice_id 
JOIN track t on t.track_id  = il.track_id 
JOIN album alb on alb.album_id = t.album_id 
JOIN best_selling_artist bsa on bsa.artist_id = alb.artist_id 
GROUP by 1,2,3,4
ORDER BY 5 DESC;

-- Question 2
-- Find most popular music genre for each country, which is higher amount in purchase ,
-- return country along with popular genre

SELECT * FROM genre g ;

WITH recursive popular_genre AS
(
	SELECT COUNT(il.quantity) AS purchases, c.country , g.name , g.genre_id ,
	ROW_NUMBER() OVER (partition by c.country ORDER BY count(il.quantity) DESC) AS RowNo
	FROM invoice_line il 
	JOIN invoice i ON i.invoice_id = il.invoice_id 
	JOIN customer c on c.customer_id = i.customer_id 
	JOIN track t on t.track_id = il.track_id 
	JOIN genre g on g.genre_id = t.genre_id 
	GROUP by 2,3,4
	ORDER BY 2 ASC, 1 DESC
	)
SELECT * from popular_genre WHERE RowNo <=1
	


/* Q3: Write a query that determines the customer that has spent the most on music for each country. 
Write a query that returns the country along with the top customer and how much they spent. 
For countries where the top amount spent is shared, provide all customers who spent this amount. */

WITH RECURSIVE 
	customter_with_country AS (
		SELECT customer.customer_id,first_name,last_name,billing_country,SUM(total) AS total_spending
		FROM invoice
		JOIN customer ON customer.customer_id = invoice.customer_id
		GROUP BY 1,2,3,4
		ORDER BY 2,3 DESC),

	country_max_spending AS(
		SELECT billing_country,MAX(total_spending) AS max_spending
		FROM customter_with_country
		GROUP BY billing_country)

SELECT cc.billing_country, cc.total_spending, cc.first_name, cc.last_name, cc.customer_id
FROM customter_with_country cc
JOIN country_max_spending ms
ON cc.billing_country = ms.billing_country
WHERE cc.total_spending = ms.max_spending
ORDER BY 1;	








