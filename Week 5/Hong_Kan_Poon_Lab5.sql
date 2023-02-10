-- Question 1
-- Get a list of all books, including the author's names (duplicate books are okay, if the book has multiple authors).
SELECT * FROM books b 
	LEFT JOIN authorship a 
	ON b.book_id = a.book_id 
	LEFT JOIN authors a2 
	ON a.author_id = a2.author_id 

-- Question 2
-- Get a list of all books withdrawn by people with the initials 'B.W.'. 
-- Show a column for the first name, last name, initials, and the title of the book. Remember: keep things concise.
SELECT m.first_name, m.last_name, CONCAT(SUBSTR(m.first_name, 1, 1), '.' ,SUBSTR(m.last_name , 1, 1), '.' ) AS 'Initials', b.title FROM books b 
	LEFT JOIN withdrawals w 
	ON b.book_id = w.book_id  
	LEFT JOIN members m 
	ON w.member_id = m.member_id 
 	WHERE SUBSTR(m.first_name , 1, 1) = 'B'
 	AND SUBSTR(m.last_name , 1, 1) = 'W'
	
-- Question 3
-- Get the number of books written by each American author. Include the first and last names of the author. 
-- Note that America might be represented in the 'country' column in more than one way - always check your results table to make sure you're getting the expected results.

SELECT a.first_name, a.last_name, a.country, COUNT(*) AS book_count FROM authors a 
	LEFT JOIN authorship a2
    ON a.author_id = a2.author_id 
    WHERE a.country IN ('USA','U.S.')
	GROUP BY a.first_name, a.last_name, a.country

-- OR
SELECT a.first_name, a.last_name, a.country,
	(SELECT count(*) FROM authorship WHERE author_id = a.author_id) AS book_count 
	FROM authors a
    WHERE a.country IN ('USA','U.S.')

-- Question 4
-- For any book withdrawn in October, get the member's first name, last name, the withdrawal date and the book's title. 
-- Hint: Try getting the month from a date using the scalar function MONTH()
SELECT m.first_name, m.last_name, w.withdrawal_date, b.title FROM books b 
	LEFT JOIN withdrawals w 
	ON b.book_id = w.book_id
	LEFT JOIN members m 
	ON w.member_id = m.member_id 
	WHERE MONTH(w.withdrawal_date) = 10

-- Question 5
-- Get a list of people who have ever returned overdue books (i.e. any withdrawal where the return date is greater than the due date). 
-- Remember that, unless otherwise specified, lists shouldn't contain duplicate rows.
SELECT DISTINCT m.first_name, m.last_name  FROM withdrawals w 
	LEFT JOIN members m 
	ON w.member_id = m.member_id 
	WHERE w.return_date > w.due_date 

-- Question 6
-- Get a list of all authors, and the books they wrote. Include authors multiple times if they wrote multiple books. 
-- Also include authors who don't have any books in the database. Hint: this is a tricky one - think back on why right joins exist in the first place.
SELECT a.first_name, a.last_name, b.title FROM authors a 
	LEFT JOIN authorship a2 
	ON a.author_id = a2.author_id 
	LEFT JOIN books b 
	ON a2.book_id = b.book_id 

-- Question 7
-- Get a list of members who've never withdrawn a book. Hint: outer joins return rows with null values if there is no match between the tables.
SELECT m.first_name, m.last_name FROM members m 
	LEFT JOIN withdrawals w 
	ON m.member_id = w.member_id 
 	WHERE w.withdrawal_id IS NULL

-- Question 8
-- Rewrite the above query as the opposite join (if you used a left join, rewrite it as a right join; if you used a right join, rewrite it as a left join). 
-- The results table should contain the same data.
SELECT m.first_name, m.last_name  FROM withdrawals w
	RIGHT JOIN members m 
	ON w.member_id = m.member_id 
	WHERE w.withdrawal_id IS NULL

-- Question 9
-- Cross join books and authors. Isn't that ridiculous?
SELECT * FROM books b, authors a 

-- Question 10
-- Get a list of all members who have the same first name as other members. Sort it by first name so you can verify the data.
SELECT m.first_name, m.last_name FROM members m 
	JOIN members m2 
	ON m.first_name = m2.first_name 
	AND m.member_id <> m2.member_id 
	ORDER BY m.first_name 
