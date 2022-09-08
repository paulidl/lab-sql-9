-- Lab | SQL Queries 9: In this lab, you will be using the Sakila database of movie rentals. 
-- You have been using this database for a couple labs already, but if you need to get the data again, refer to the official installation link.

-- Instructions: In this lab we will find the customers who were active in consecutive months of May and June. Follow the steps to complete the analysis.

-- 1. Create a table rentals_may to store the data from rental table with information for the month of May.
-- 2. Insert values in the table rentals_may using the table rental, filtering values only for the month of May.

USE sakila;
SELECT * FROM sakila.rental;

DROP TABLE IF EXISTS sakila.rentals_may;

CREATE TABLE sakila.rentals_may AS
SELECT *
FROM sakila.rental
WHERE MONTH(rental_date) = 5;

SELECT * FROM sakila.rentals_may;

-- 3. Create a table rentals_june to store the data from rental table with information for the month of June.
-- 4. Insert values in the table rentals_june using the table rental, filtering values only for the month of June.

DROP TABLE IF EXISTS sakila.rentals_june;

CREATE TABLE sakila.rentals_june AS
SELECT *
FROM sakila.rental
WHERE MONTH(rental_date) = 6;

SELECT * FROM sakila.rentals_june;

-- 5. Check the number of rentals for each customer for May.

SELECT rentals_may.customer_id, customer.first_name, customer.last_name, count(rental_id) AS total_number_of_rentals_in_May
FROM sakila.rentals_may
JOIN customer ON customer.customer_id = rentals_may.customer_id
GROUP BY customer_id 
ORDER BY count(rental_id) DESC;

-- 6. Check the number of rentals for each customer for June.

SELECT rentals_june.customer_id, customer.first_name, customer.last_name, count(rental_id) AS total_number_of_rentals_in_June
FROM sakila.rentals_june
JOIN customer ON customer.customer_id = rentals_june.customer_id
GROUP BY customer_id 
ORDER BY count(rental_id) DESC;

-- 7. Create a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:

-- 7.1. Check the number of rentals for each customer for May
-- 7.2. Check the number of rentals for each customer for June

-- Hint: You can store the results from the two queries in two separate dataframes.
-- Write a function that checks if customer borrowed more or less films in the month of June as compared to May.
-- Hint: For this part, you can create a join between the two dataframes created before, using the merge function available for pandas dataframes. Here is a link to the documentation for the merge function.