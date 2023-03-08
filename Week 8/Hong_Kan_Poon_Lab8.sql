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

CREATE TABLE IF NOT EXISTS assignments (
	assignment_id INT PRIMARY KEY AUTO_INCREMENT,
	day DATE,
	shift ENUM ('morning','afternoon'),
	assignment varchar(255)
);

INSERT INTO assignments (day, shift, assignment)
	VALUES
		('2023-03-06',1,'main desk'),
		('2023-03-06',1,'catalogue'),
		('2023-03-06',2,'children''s library'),
		('2023-03-06',1,'reference'),
		('2023-03-06',1,'catalogue'),
		('2023-03-07',1,'main desk'),
		('2023-03-07',1,'reference'),
		('2023-03-07',2,'main desk'),
		('2023-03-07',2,'catalogue'),
		('2023-03-08',1,'main desk'),
		('2023-03-08',1,'catalogue'),
		('2023-03-08',2,'reference'),
		('2023-03-13',1,'main desk'),
		('2023-03-13',1,'reference'),
		('2023-03-13',1,'children''s library'),
		('2023-03-13',1,'reference'),
		('2023-03-13',1,'catalogue'),
		('2023-03-14',1,'main desk'),
		('2023-03-14',1,'children''s library'),
		('2023-03-14',2,'main desk'),
		('2023-03-14',2,'catalogue'),
		('2023-03-15',1,'main desk'),
		('2023-03-15',1,'catalogue')

CREATE TABLE IF NOT EXISTS duty (
	duty_id INT PRIMARY KEY AUTO_INCREMENT,
    librarian_id INT,
    assignment_id INT,
    CONSTRAINT librarian_id_fk FOREIGN KEY (librarian_id) REFERENCES librarians(librarian_id) ON DELETE SET NULL,
    CONSTRAINT assignment_id_fk FOREIGN KEY (assignment_id) REFERENCES assignments(assignment_id) ON DELETE SET NULL
);

INSERT INTO duty (librarian_id, assignment_id)
	VALUES
		(1,1),
		(1,2),
		(2,3),
		(3,4),
		(3,5),
		(4,6),
		(4,7),
		(5,8),
		(5,9),
		(6,10),
		(6,11),
		(7,12),
		(8,13),
		(8,14),
		(9,15),
		(3,16),
		(3,17),
		(4,18),
		(4,19),
		(6,20),
		(6,21),
		(5,22),
		(5,23)
		
SELECT DISTINCT librarian_fname , librarian_surname , assignments.shift
FROM librarians
INNER JOIN duty ON librarians.librarian_id = duty.librarian_id
INNER JOIN assignments ON duty.assignment_id = assignments.assignment_id
WHERE assignments.day = '2023-03-13'

SELECT librarian_fname, librarian_surname, assignments.assignment
FROM librarians
INNER JOIN duty ON librarians.librarian_id = duty.librarian_id
INNER JOIN assignments ON duty.assignment_id = assignments.assignment_id
WHERE assignments.day = '2023-03-13' AND librarian_fname = 'Beverly' AND librarian_surname = 'Cleary'
