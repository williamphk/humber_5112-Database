CREATE TABLE IF NOT EXISTS librarians (
    librarian_id INT PRIMARY KEY AUTO_INCREMENT,
    librarian_fname varchar(255) NOT NULL,
    librarian_surname varchar(255) NOT NULL
);

INSERT INTO librarians (librarian_fname, librarian_surname)
	VALUES
		('Jesse', 'Shera'),
		('Anne Carroll', 'Moore'),
		('Beverly', 'Cleary'),
		('Marcel', 'Duchamp'),
		('Audre', 'Lorde'),
		('Carla', 'Hayden'),
		('Ardelia', 'Lortz'),
		('Mary', 'Ahern'),
		('Dolly', 'Parton')

CREATE TABLE IF NOT EXISTS shifts (
    shift_id INT PRIMARY KEY AUTO_INCREMENT,
    shift INT NOT NULL
);

INSERT INTO shifts (shift)
	VALUES
		(1),
		(2)
		
CREATE TABLE IF NOT EXISTS day (
    day_id INT PRIMARY KEY AUTO_INCREMENT,
    day DATE NOT NULL
);

INSERT INTO day (day)
	VALUES
		('2023-03-06'),
		('2023-03-07'),
		('2023-03-08'),
		('2023-03-13'),
		('2023-03-14'),
		('2023-03-15')									

CREATE TABLE IF NOT EXISTS assignments (
	assignment_id INT PRIMARY KEY AUTO_INCREMENT,
	assignment varchar(255) NOT NULL
);

INSERT INTO assignments (assignment)
	VALUES
		('main desk'),
		('catalogue'),
		('children''s library'),
		('reference')

CREATE TABLE IF NOT EXISTS librarian_shift (
	librarian_shift_id INT PRIMARY KEY AUTO_INCREMENT,
    librarian_id INT,
    shift_id INT,
    CONSTRAINT librarian_id_fk_shift FOREIGN KEY (librarian_id) REFERENCES librarians(librarian_id) ON DELETE SET NULL,
    CONSTRAINT shift_id_fk FOREIGN KEY (shift_id) REFERENCES shifts(shift_id) ON DELETE SET NULL
);

INSERT INTO librarian_shift (librarian_id, shift_id)
	VALUES
		(1,1),
		(2,2),
		(3,1),
		(4,1),
		(5,2),
		(6,1),
		(7,2),
		(8,1),
		(9,1),
		(3,1),
		(4,1),
		(6,2),
		(5,1)

CREATE TABLE IF NOT EXISTS librarian_day (
	librarian_day_id INT PRIMARY KEY AUTO_INCREMENT,
    librarian_id INT,
    day_id INT,
    CONSTRAINT librarian_id_fk_day FOREIGN KEY (librarian_id) REFERENCES librarians(librarian_id) ON DELETE SET NULL,
    CONSTRAINT day_id_fk FOREIGN KEY (day_id) REFERENCES day(day_id) ON DELETE SET NULL
);

INSERT INTO librarian_day (librarian_id, day_id)
	VALUES
		(1,1),
		(2,1),
		(3,1),
		(4,2),
	    (5,2),
	    (6,3),
	    (7,3),	    
	    (8,4),
	    (9,4),
	    (3,4),
	    (4,5),
	    (6,5),
	    (5,6)

CREATE TABLE IF NOT EXISTS librarian_assignment (
	librarian_assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    librarian_id INT,
    assignment_id INT,
    CONSTRAINT librarian_id_fk FOREIGN KEY (librarian_id) REFERENCES librarians(librarian_id) ON DELETE SET NULL,
    CONSTRAINT assignment_id_fk FOREIGN KEY (assignment_id) REFERENCES assignments(assignment_id) ON DELETE SET NULL
);

INSERT INTO librarian_assignment (librarian_id, assignment_id)
	VALUES
		(1,1),
		(1,2),
		(2,3),
		(3,4),
		(3,2),
		(4,1),
		(4,4),
		(5,1),
		(5,2),
		(6,1),
		(6,2),
		(7,4),
		(8,1),
		(8,4),
		(9,3),
		(3,4),
		(3,2),
		(4,1),
		(4,3),
		(6,1),
		(6,2),
		(5,1),
		(5,2)
		
SELECT DISTINCT librarian_fname, librarian_surname, shifts.shift
FROM librarians
INNER JOIN librarian_assignment ON librarians.librarian_id = librarian_assignment.librarian_id
INNER JOIN assignments ON librarian_assignment.assignment_id = assignments.assignment_id
INNER JOIN librarian_shift ON librarians.librarian_id = librarian_shift.librarian_id
INNER JOIN shifts ON librarian_shift.shift_id = shifts.shift_id
INNER JOIN librarian_day ON librarians.librarian_id = librarian_day.librarian_id
INNER JOIN day ON librarian_day.day_id = day.day_id
WHERE day.day = '2023-03-13'

SELECT *
FROM librarians
LEFT JOIN librarian_assignment ON librarians.librarian_id = librarian_assignment.librarian_id
LEFT JOIN assignments ON librarian_assignment.assignment_id = assignments.assignment_id
LEFT JOIN librarian_shift ON librarians.librarian_id = librarian_shift.librarian_id
LEFT JOIN shifts ON librarian_shift.shift_id = shifts.shift_id
LEFT JOIN librarian_day ON librarians.librarian_id = librarian_day.librarian_id
LEFT JOIN day ON librarian_day.day_id = day.day_id
