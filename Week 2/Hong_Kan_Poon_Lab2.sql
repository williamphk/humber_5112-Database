-- Lab 2
-- Question 1
-- Get all the rows in the invoice table with an invoiceId of 400 or greater, and where the billingState is listed. 
-- Sort these rows so that the invoiceId goes from highest to lowest.
SELECT * FROM Invoice
    WHERE invoiceId >= 400
    AND billingState IS NOT NULL
    ORDER BY invoiceId DESC

-- Question 2
-- Get 6 rows from the employee table. Sort the employees from oldest to youngest. Exclude the two oldest.
SELECT * FROM Employee
    ORDER BY BirthDate ASC
    LIMIT 6
    OFFSET 2

-- Question 3
-- Get a list of cities where the store has customers, without duplicates. Make all the city names lowercased.
SELECT DISTINCT LOWER(city) from Customer

-- Question 4
-- Get a list of all customers who have the letter 't' (either uppercase or lowercase) in either their first or last names. Include a column that lists the third letter of their last name.
SELECT firstName, lastName, SUBSTR(lastName, 3,1) from Customer
    WHERE firstName LIKE '%t%' OR lastName LIKE '%t%'

-- Question 5
-- Get all of the rows from the artist table that contain an o with an ülaut ('ö'). In the results table, replace this character with a smiley face (':)')
SELECT REPLACE(Name, 'ö', ':)') AS 'Name' FROM artist
    WHERE Name LIKE '%ö%'

-- Question 6
-- Get all results from the customer table. Replace null values in the state and fax columns with an empty string.
SELECT COALESCE(State,'') AS 'State', COALESCE(Fax,'') AS 'Fax'
    FROM customer

-- Question 7
-- Return all album title longer than 20 characters. Only display the first twenty characters, and make all characters lowercase.
SELECT LOWER(SUBSTR(Title, 1, 20)) AS Title FROM album
    WHERE LENGTH(Title) > 20

-- Question 8
-- Get all invoices from Berlin where the total is more than $5, and the invoices from Toronto where the total is more than $5. 
-- Sort from newest to oldest. Remember: if there is more than one way to write your code, you should stop and think about which way is best.
SELECT * FROM Invoice
    WHERE BillingCity IN ('Berlin', 'Toronto') 
    AND Total > 5
    ORDER BY InvoiceDate DESC
    