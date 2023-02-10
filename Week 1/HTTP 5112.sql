-- Week 1

-- Question 3

-- Question 4 
-- Select the rows for all the customers in Brazil and Canada.
SELECT * FROM customer
    WHERE country = 'Canada'
    OR country = 'Brazil'

SELECT * FROM customer
    WHERE country IN ('Canada', 'Brazil')

-- Question 5 
-- Who are all the customers with hotmail addresses? 
-- Hint: there are other hotmail "top level domains" besides '.com', for example "hotmail.co.uk".
SELECT * FROM customer 
    WHERE email Like '%@hotmail.%'

-- Question 6 
-- Who are all the customers who don't have a company listed?
SELECT * FROM customer
    WHERE company IS NULL

-- Question 7
-- What are the genres whose name begins with a letter in the second half of the alphabet?
SELECT * FROM Genre
    WHERE Name > 'O'

SELECT name FROM Genre
    WHERE name BETWEEN "N" and "Z"

-- Question 8
-- List the cities with employees, reverse alphabetically. Hint: a list of things shouldn't contain duplicates.
SELECT DISTINCT city FROM employee
    ORDER BY city DESC 