-- Lab 3
-- Question 1
-- Write a statement that shows all the thefts that happened in neighbourhoods that have 'Humber' in the name.
SELECT * 
	FROM bikeTheft
	WHERE NeighbourhoodName LIKE '%Humber%'

-- Question 2
-- Narrow the list from question 1 down by only showing thefts in odd-numbered years.
SELECT * 
	FROM bikeTheft
	WHERE NeighbourhoodName LIKE '%Humber%'
	AND Report_Year % 2 != 0

-- Question 3
-- Get the average cost of the bikes recorded in this table. Format this result as a dollar figure, including a dollar sign, rounded to the nearest penny.
SELECT CONCAT('$', Round(AVG(Cost_of_Bike),1)) AS 'Average cost of the bikes'
	FROM bikeTheft

-- Question 4
-- Write a query that returns the number of unique combinations of bike colour & speed. Note: null is not a colour or a speed.
SELECT COUNT(DISTINCT Bike_Colour, Bike_Speed)
	FROM bikeTheft


-- Question 5
-- Write a statement that shows a list of location types with more than 500 total thefts.
SELECT Location_Type FROM bikeTheft 
	GROUP BY Location_Type 
	HAVING Count(Location_Type) > 500

-- Question 6
-- Write a statement that returns the date of the first bike theft contained in this table. (Use an aggregate function for this.)
SELECT MIN(Occurrence_Date) 
	FROM bikeTheft

-- Question 7
-- Write a statement that returns only the top 10 neighbourhoods with the most reported thefts.
SELECT NeighbourhoodName FROM bikeTheft
	GROUP BY NeighbourhoodName 
	ORDER BY count(*) DESC 
	LIMIT 10

-- Question 8
-- Select 2 columns. The first column should be the sum of the 'Cost of Bike' column, divided by the total number of rows. 
-- The second column should be result of running the AVG() function on the 'Cost of Bike' column.
SELECT SUM(Cost_of_Bike) / COUNT(*), AVG(Cost_of_Bike) FROM bikeTheft
	

-- Question 9
-- In a code comment, tell me if first column and the second column of the previous question are equal. 
-- If they are, explain why. If they are not, explain what you could do to make the result of the AVG() function match the value of the first column.
-- Answer: Because the COUNT(*) includes the null values while AVG() excludes the null values.
-- 		   In order to match the value of the first column, we can use COALESCE() to replace all null values with zero first before running the AVG function

-- Bonus Question
-- Write a statement that returns the top 5 neighbourhoods in terms of thefts, 
-- and a column that shows how many incidents they had above the average neighbourhood. This may be a good case for a subquery.
 SELECT NeighbourhoodName, COUNT(*) -  (SELECT round(count(*) / count(DISTINCT NeighbourhoodName),0) FROM bikeTheft
	WHERE NeighbourhoodName IS NOT NULL) AS 'Above Average'
	FROM bikeTheft
	GROUP BY NeighbourhoodName 
	ORDER BY count(*) DESC 
	LIMIT 5

-- OR
 SELECT NeighbourhoodName, COUNT(*) - (SELECT ROUND(avg(total),0) FROM (SELECT count(*) AS total FROM bikeTheft WHERE NeighbourhoodName IS NOT NULL GROUP BY NeighbourhoodName) AS tbl)
	AS 'Above Average'
	FROM bikeTheft
	GROUP BY NeighbourhoodName 
	ORDER BY count(*) DESC 
	LIMIT 5