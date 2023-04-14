CREATE TABLE IF NOT EXISTS Line (
    line_id INT AUTO_INCREMENT PRIMARY KEY,
    line_name VARCHAR(255) NOT NULL
);

INSERT INTO Line (line_name)
VALUES ('Line 1 - Yonge-University'),
       ('Line 2 - Bloor-Danforth'),
       ('Line 3 - Scarborough'),
       ('Line 4 - Sheppard')

CREATE TABLE IF NOT EXISTS Stations (
    station_id INT AUTO_INCREMENT PRIMARY KEY,
    station_name VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO Stations (station_name)
VALUES ('Sheppard-Yonge'),
       ('Bayview'),
       ('Bessarion'),
       ('Leslie'),
       ('Don Mills');

CREATE TABLE IF NOT EXISTS Line_Stations (
    lines_stations_id INT AUTO_INCREMENT PRIMARY KEY,
    line_id INT,
    station_id INT,
    FOREIGN KEY (line_id) REFERENCES Line(line_id) ON DELETE CASCADE,
    FOREIGN KEY (station_id) REFERENCES Stations(station_id) ON DELETE CASCADE
);

INSERT INTO Line_Stations (line_id, station_id)
VALUES (4, 1),
       (4, 2),
       (4, 3),
       (4, 4),
       (4, 5);

CREATE TABLE IF NOT EXISTS Trains (
    train_id INT AUTO_INCREMENT PRIMARY KEY,
    train_name VARCHAR(255) NOT NULL UNIQUE,
    line_id INT,
    FOREIGN KEY (line_id) REFERENCES Line(line_id) ON DELETE CASCADE
);

INSERT INTO Trains (train_name, line_id)
VALUES ('Train 401', 4),
       ('Train 402', 4),
       ('Train 403', 4),
       ('Train 404', 4);

CREATE TABLE IF NOT EXISTS Schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    line_id INT,
    station_id INT,
    train_id INT,
    direction VARCHAR(255),
    departure_time TIME NOT NULL,
    delay TIME,
    FOREIGN KEY (line_id) REFERENCES Line(line_id) ON DELETE CASCADE,
    FOREIGN KEY (station_id) REFERENCES Stations(station_id) ON DELETE CASCADE,
    FOREIGN KEY (train_id) REFERENCES Trains(train_id) ON DELETE CASCADE
);

INSERT INTO Schedules (line_id, station_id, train_id, direction, departure_time, delay)
VALUES 
-- Train 401
-- Sheppard-Yonge to Don Mills
     (4, 1, 1, 'Westbound', '06:00:00', '00:00:00'),
       (4, 2, 1, 'Westbound', '06:05:00', '00:00:00'),
       (4, 3, 1, 'Westbound', '06:10:00', '00:00:00'),
       (4, 4, 1, 'Westbound', '06:15:00', '00:00:00'),
       (4, 5, 1, 'Westbound', '06:20:00', '00:00:00'),
-- Don Mills to Sheppard-Yonge
       (4, 5, 1, 'Eastbound', '06:30:00', '00:00:00'),
       (4, 4, 1, 'Eastbound', '06:35:00', '00:00:00'),
       (4, 3, 1, 'Eastbound', '06:40:00', '00:00:00'),
       (4, 2, 1, 'Eastbound', '06:45:00', '00:00:00'),
       (4, 1, 1, 'Eastbound', '06:50:00', '00:00:00'),
-- Sheppard-Yonge to Don Mills
       (4, 1, 1, 'Westbound', '07:00:00', '00:00:00'),
       (4, 2, 1, 'Westbound', '07:05:00', '00:00:00'),
       (4, 3, 1, 'Westbound', '07:10:00', '00:00:00'),
       (4, 4, 1, 'Westbound', '07:15:00', '00:00:00'),
       (4, 5, 1, 'Westbound', '07:20:00', '00:00:00'),
-- Don Mills to Sheppard-Yonge
       (4, 5, 1, 'Eastbound', '07:30:00', '00:00:00'),
       (4, 4, 1, 'Eastbound', '07:35:00', '00:00:00'),
       (4, 3, 1, 'Eastbound', '07:40:00', '00:00:00'),
       (4, 2, 1, 'Eastbound', '07:45:00', '00:00:00'),
       (4, 1, 1, 'Eastbound', '07:50:00', '00:00:00'),
-- Sheppard-Yonge to Don Mills
       (4, 1, 1, 'Westbound', '08:00:00', '00:00:00'),
       (4, 2, 1, 'Westbound', '08:05:00', '00:00:00'),
       (4, 3, 1, 'Westbound', '08:10:00', '00:00:00'),
       (4, 4, 1, 'Westbound', '08:15:00', '00:00:00'),
       (4, 5, 1, 'Westbound', '08:20:00', '00:00:00'),
-- Don Mills to Sheppard-Yonge
       (4, 5, 1, 'Eastbound', '08:30:00', '00:00:00'),
       (4, 4, 1, 'Eastbound', '08:35:00', '00:00:00'),
       (4, 3, 1, 'Eastbound', '08:40:00', '00:00:00'),
       (4, 2, 1, 'Eastbound', '08:45:00', '00:00:00'),
       (4, 1, 1, 'Eastbound', '08:50:00', '00:00:00'),
-- Train 402
-- Don Mills to Sheppard-Yonge
       (4, 5, 2, 'Eastbound', '06:00:00', '00:00:00'),
       (4, 4, 2, 'Eastbound', '06:05:00', '00:00:00'),
       (4, 3, 2, 'Eastbound', '06:10:00', '00:00:00'),
       (4, 2, 2, 'Eastbound', '06:15:00', '00:00:00'),
       (4, 1, 2, 'Eastbound', '06:20:00', '00:00:00'),
-- Sheppard-Yonge to Don Mills
       (4, 1, 2, 'Westbound', '06:30:00', '00:00:00'),
       (4, 2, 2, 'Westbound', '06:35:00', '00:00:00'),
       (4, 3, 2, 'Westbound', '06:40:00', '00:00:00'),
       (4, 4, 2, 'Westbound', '06:45:00', '00:00:00'),
       (4, 5, 2, 'Westbound', '06:50:00', '00:00:00'),
-- Don Mills to Sheppard-Yonge
       (4, 5, 2, 'Eastbound', '07:00:00', '00:00:00'),
       (4, 4, 2, 'Eastbound', '07:05:00', '00:00:00'),
       (4, 3, 2, 'Eastbound', '07:10:00', '00:00:00'),
       (4, 2, 2, 'Eastbound', '07:15:00', '00:00:00'),
       (4, 1, 2, 'Eastbound', '07:20:00', '00:00:00'),
-- Sheppard-Yonge to Don Mills
       (4, 1, 2, 'Westbound', '07:30:00', '00:00:00'),
       (4, 2, 2, 'Westbound', '07:35:00', '00:00:00'),
       (4, 3, 2, 'Westbound', '07:40:00', '00:00:00'),
       (4, 4, 2, 'Westbound', '07:45:00', '00:00:00'),
       (4, 5, 2, 'Westbound', '07:50:00', '00:00:00'),
-- Don Mills to Sheppard-Yonge
       (4, 5, 2, 'Eastbound', '08:00:00', '00:00:00'),
       (4, 4, 2, 'Eastbound', '08:05:00', '00:00:00'),
       (4, 3, 2, 'Eastbound', '08:10:00', '00:00:00'),
       (4, 2, 2, 'Eastbound', '08:15:00', '00:00:00'),
       (4, 1, 2, 'Eastbound', '08:20:00', '00:00:00'),
-- Sheppard-Yonge to Don Mills
       (4, 1, 2, 'Westbound', '08:30:00', '00:00:00'),
       (4, 2, 2, 'Westbound', '08:35:00', '00:00:00'),
       (4, 3, 2, 'Westbound', '08:40:00', '00:00:00'),
       (4, 4, 2, 'Westbound', '08:45:00', '00:00:00'),
       (4, 5, 2, 'Westbound', '08:50:00', '00:00:00'),
-- Train 403
-- Sheppard-Yonge to Don Mills
       (4, 1, 3, 'Westbound', '06:10:00', '00:00:00'),
       (4, 2, 3, 'Westbound', '06:15:00', '00:00:00'),
       (4, 3, 3, 'Westbound', '06:20:00', '00:00:00'),
       (4, 4, 3, 'Westbound', '06:25:00', '00:00:00'),
       (4, 5, 3, 'Westbound', '06:30:00', '00:00:00'),
-- Don Mills to Sheppard-Yonge
       (4, 5, 3, 'Eastbound', '06:40:00', '00:00:00'),
       (4, 4, 3, 'Eastbound', '06:45:00', '00:00:00'),
       (4, 3, 3, 'Eastbound', '06:50:00', '00:00:00'),
       (4, 2, 3, 'Eastbound', '06:55:00', '00:00:00'),
       (4, 1, 3, 'Eastbound', '07:00:00', '00:00:00'),
-- Sheppard-Yonge to Don Mills
       (4, 1, 3, 'Westbound', '07:10:00', '00:00:00'),
       (4, 2, 3, 'Westbound', '07:15:00', '00:00:00'),
       (4, 3, 3, 'Westbound', '07:20:00', '00:00:00'),
       (4, 4, 3, 'Westbound', '07:25:00', '00:00:00'),
       (4, 5, 3, 'Westbound', '07:30:00', '00:00:00'),
-- Don Mills to Sheppard-Yonge
       (4, 5, 3, 'Eastbound', '07:40:00', '00:00:00'),
       (4, 4, 3, 'Eastbound', '07:45:00', '00:00:00'),
       (4, 3, 3, 'Eastbound', '07:50:00', '00:00:00'),
       (4, 2, 3, 'Eastbound', '07:55:00', '00:00:00'),
       (4, 1, 3, 'Eastbound', '08:00:00', '00:00:00'),
-- Sheppard-Yonge to Don Mills
       (4, 1, 3, 'Westbound', '08:10:00', '00:00:00'),
       (4, 2, 3, 'Westbound', '08:15:00', '00:00:00'),
       (4, 3, 3, 'Westbound', '08:20:00', '00:00:00'),
       (4, 4, 3, 'Westbound', '08:25:00', '00:00:00'),
       (4, 5, 3, 'Westbound', '08:30:00', '00:00:00'),
-- Don Mills to Sheppard-Yonge
       (4, 5, 3, 'Eastbound', '08:40:00', '00:00:00'),
       (4, 4, 3, 'Eastbound', '08:45:00', '00:00:00'),
       (4, 3, 3, 'Eastbound', '08:50:00', '00:00:00'),
       (4, 2, 3, 'Eastbound', '08:55:00', '00:00:00'),
       (4, 1, 3, 'Eastbound', '09:00:00', '00:00:00'),
-- Train 404
-- Don Mills to Sheppard-Yonge
       (4, 5, 4, 'Eastbound', '06:10:00', '00:00:00'),
       (4, 4, 4, 'Eastbound', '06:15:00', '00:00:00'),
       (4, 3, 4, 'Eastbound', '06:20:00', '00:00:00'),
       (4, 2, 4, 'Eastbound', '06:25:00', '00:00:00'),
       (4, 1, 4, 'Eastbound', '06:30:00', '00:00:00'),
-- Sheppard-Yonge to Don Mills
       (4, 1, 4, 'Westbound', '06:40:00', '00:00:00'),
       (4, 2, 4, 'Westbound', '06:45:00', '00:00:00'),
       (4, 3, 4, 'Westbound', '06:50:00', '00:00:00'),
       (4, 4, 4, 'Westbound', '06:55:00', '00:00:00'),
       (4, 5, 4, 'Westbound', '07:00:00', '00:00:00'),
-- Don Mills to Sheppard-Yonge
       (4, 5, 4, 'Eastbound', '07:10:00', '00:00:00'),
       (4, 4, 4, 'Eastbound', '07:15:00', '00:00:00'),
       (4, 3, 4, 'Eastbound', '07:20:00', '00:00:00'),
       (4, 2, 4, 'Eastbound', '07:25:00', '00:00:00'),
       (4, 1, 4, 'Eastbound', '07:30:00', '00:00:00'),
-- Sheppard-Yonge to Don Mills
       (4, 1, 4, 'Westbound', '07:40:00', '00:00:00'),
       (4, 2, 4, 'Westbound', '07:45:00', '00:00:00'),
       (4, 3, 4, 'Westbound', '07:50:00', '00:00:00'),
       (4, 4, 4, 'Westbound', '07:55:00', '00:00:00'),
       (4, 5, 4, 'Westbound', '08:00:00', '00:00:00'),
-- Don Mills to Sheppard-Yonge
       (4, 5, 4, 'Eastbound', '08:10:00', '00:00:00'),
       (4, 4, 4, 'Eastbound', '08:15:00', '00:00:00'),
       (4, 3, 4, 'Eastbound', '08:20:00', '00:00:00'),
       (4, 2, 4, 'Eastbound', '08:25:00', '00:00:00'),
       (4, 1, 4, 'Eastbound', '08:30:00', '00:00:00'),
-- Sheppard-Yonge to Don Mills
       (4, 1, 4, 'Westbound', '08:40:00', '00:00:00'),
       (4, 2, 4, 'Westbound', '08:45:00', '00:00:00'),
       (4, 3, 4, 'Westbound', '08:50:00', '00:00:00'),
       (4, 4, 4, 'Westbound', '08:55:00', '00:00:00'),
       (4, 5, 4, 'Westbound', '09:00:00', '00:00:00');

SELECT *
  FROM Schedules s
  JOIN Line l ON s.line_id = l.line_id
  JOIN Stations st ON s.station_id = st.station_id
  JOIN Trains t ON s.train_id = t.train_id
  WHERE s.line_id = 4 AND t.train_id = 3
  ORDER BY s.schedule_id;

-- show the next three trains vs current time, station, line
CREATE VIEW next_three_schedules_Bessarion_Eastbound AS
  SELECT
      l.line_name,
      st.station_name,
      t.train_name,
      s.departure_time,
      SEC_TO_TIME(TIME_TO_SEC(s.departure_time) + TIME_TO_SEC(s.delay)) AS actual_departure_time,
      s.direction
  FROM Schedules s
    JOIN Line l ON s.line_id = l.line_id
    JOIN Stations st ON s.station_id = st.station_id
    JOIN Trains t ON s.train_id = t.train_id
  WHERE
    l.line_id = 4 AND
    st.station_name = "Sheppard-Yonge" AND 
      s.departure_time >= "09:00:00" AND
      s.direction = "Westbound"
  ORDER BY
      s.departure_time
  LIMIT 5;

UPDATE Schedules 
  SET delay = '00:05:00'
  WHERE schedule_id = 1

DROP TABLE IF EXISTS Schedules;
CREATE TABLE IF NOT EXISTS Schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    line_id INT,
    station_id INT,
    train_id INT,
    direction VARCHAR(255),
    departure_time TIME NOT NULL,
    delay TIME,
    FOREIGN KEY (line_id) REFERENCES Line(line_id) ON DELETE CASCADE,
    FOREIGN KEY (station_id) REFERENCES Stations(station_id) ON DELETE CASCADE,
    FOREIGN KEY (train_id) REFERENCES Trains(train_id) ON DELETE CASCADE
);

DROP PROCEDURE IF EXISTS InsertTrainSchedule;
DELIMITER //
CREATE PROCEDURE InsertTrainSchedule(
    IN param_line_id INT,
    IN param_train_id INT,
    IN param_start_station_id INT,
    IN param_end_station_id INT,
    IN param_start_time TIME,
    IN param_end_time TIME
)
BEGIN
    DECLARE var_current_time TIME;
    DECLARE var_direction ENUM('Westbound', 'Eastbound');
    DECLARE var_station_id INT;

    -- Set the initial direction based on the start and end station ids
    IF param_start_station_id < param_end_station_id THEN
      -- Setting the start time of the loop
      SET var_current_time = param_start_time;
      -- Loop until the end time
      WHILE var_current_time <= param_end_time DO
          -- Westbound
          SET var_direction = 'Westbound';       
          SET var_station_id = param_start_station_id;
          WHILE var_station_id < param_end_station_id DO
              INSERT INTO Schedules (line_id, station_id, train_id, direction, departure_time, delay)
              VALUES (param_line_id, var_station_id, param_train_id, var_direction, var_current_time, '00:00:00');
              
             -- The time difference between stations is 5 minutes
              SET var_current_time = ADDTIME(var_current_time, '00:05:00');
              SET var_station_id = var_station_id + 1;
          END WHILE;
         
          -- The train wait at the terminal for additional 10 minutes
          SET var_current_time = ADDTIME(var_current_time, '00:10:00');
  
          -- Eastbound
          SET var_direction = 'Eastbound';
          SET var_station_id = param_end_station_id;
          WHILE var_station_id > param_start_station_id DO
              INSERT INTO Schedules (line_id, station_id, train_id, direction, departure_time, delay)
              VALUES (param_line_id, var_station_id, param_train_id, var_direction, var_current_time, '00:00:00');
              
             -- The time difference between stations is 5 minutes
              SET var_current_time = ADDTIME(var_current_time, '00:05:00');
              SET var_station_id = var_station_id - 1;
          END WHILE;
  
          -- The train wait at the terminal for additional 10 minutes
          SET var_current_time = ADDTIME(var_current_time, '00:10:00');
      END WHILE;
    -- Set the initial direction based on the start and end station ids
    ELSEIF param_start_station_id > param_end_station_id THEN
      -- Setting the start time of the loop
      SET var_current_time = param_start_time;
      -- Loop until the end time
      WHILE var_current_time <= param_end_time DO
          -- Westbound
          SET var_direction = 'Eastbound';
          SET var_station_id = param_start_station_id;
          WHILE var_station_id > param_end_station_id DO
              INSERT INTO Schedules (line_id, station_id, train_id, direction, departure_time, delay)
              VALUES (param_line_id, var_station_id, param_train_id, var_direction, var_current_time, '00:00:00');
              
             -- The time difference between stations is 5 minutes
              SET var_current_time = ADDTIME(var_current_time, '00:05:00');
              SET var_station_id = var_station_id - 1;
          END WHILE;
         
          -- The train wait at the terminal for additional 10 minutes
          SET var_current_time = ADDTIME(var_current_time, '00:10:00');
          SET var_station_id = var_station_id - 1;
  
          -- Eastbound
          SET var_direction = 'Westbound';
          SET var_station_id = param_end_station_id;
          WHILE var_station_id < param_start_station_id DO
              INSERT INTO Schedules (line_id, station_id, train_id, direction, departure_time, delay)
              VALUES (param_line_id, var_station_id, param_train_id, var_direction, var_current_time, '00:00:00');
              
             -- The time difference between stations is 5 minutes
              SET var_current_time = ADDTIME(var_current_time, '00:05:00');
              SET var_station_id = var_station_id + 1;
          END WHILE;
  
          -- The train wait at the terminal for additional 10 minutes
          SET var_current_time = ADDTIME(var_current_time, '00:10:00');
      END WHILE;
    END IF;
END //
DELIMITER ;


CALL InsertTrainSchedule(4, 1, 1, 5, '09:00:00', '22:00:00');
CALL InsertTrainSchedule(4, 2, 5, 1, '09:00:00', '22:00:00');
CALL InsertTrainSchedule(4, 3, 1, 5, '09:15:00', '22:15:00');
CALL InsertTrainSchedule(4, 4, 5, 1, '09:15:00', '22:15:00');

DELIMITER //
CREATE TRIGGER check_departure_time_update
BEFORE UPDATE ON Schedules
FOR EACH ROW
BEGIN
  DECLARE next_departure_time TIME;
  
  SELECT departure_time
  INTO next_departure_time
  FROM Schedules
  -- I'm not checking the station because the station_id will change along like 1,2,3,4,5 and 5,4,3,2,1 
    AND line_id = NEW.line_id
    AND train_id = NEW.train_id
    AND departure_time > OLD.departure_time
  ORDER BY departure_time ASC
  LIMIT 1;
  
  IF NEW.departure_time >= next_departure_time THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Error: Updated departure time cannot be later than or equal to the departure time of the next train.';
  END IF;
END;
//
DELIMITER ;

UPDATE Schedules 
  SET departure_time = '09:04:59'
  WHERE schedule_id = 1

DROP TABLE IF EXISTS Schedules_log;
CREATE TABLE IF NOT EXISTS Schedules_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    action VARCHAR(255),
    schedule_id INT,
    line_id INT,
    station_id INT,
    train_id INT,
    direction VARCHAR(255),
    departure_time_new TIME,
    departure_time_old TIME,
    timestamp TIMESTAMP
);  
  
DELIMITER //
CREATE TRIGGER log_schedule_deletion
  AFTER DELETE ON Schedules
  FOR EACH ROW
  BEGIN
    INSERT INTO Schedules_log (
      action,
      schedule_id,
      line_id,
      station_id,
      train_id,
      direction,
      departure_time_old,
      timestamp
    )
    VALUES (
      'DELETE',
      OLD.schedule_id,
      OLD.line_id,
      OLD.station_id,
      OLD.train_id,
      OLD.direction,
      OLD.departure_time,
      NOW()
    );
  END; //
DELIMITER ;

DELETE FROM Schedules 
  WHERE schedule_id = 1;

DROP PROCEDURE IF EXISTS CalculateTravelTime;
DELIMITER //
CREATE PROCEDURE CalculateTravelTime(
  IN param_line_id INT,
  IN param_origin_station_id INT,
  IN param_destination_station_id INT,
  OUT param_travel_time TIME
)
BEGIN
  DECLARE var_origin_departure_time TIME;
  DECLARE var_destination_departure_time TIME;

  -- Get the departure time of the first train at the origin station
  SELECT
    MIN(departure_time)
  INTO var_origin_departure_time
  FROM
    Schedules
  WHERE
    line_id = param_line_id AND
        train_id = 1 AND
    station_id = param_origin_station_id;

  -- Get the departure time of the next train after the origin station train at the destination station
  SELECT
    MIN(departure_time)
  INTO var_destination_departure_time
  FROM
    Schedules
  WHERE
    line_id = param_line_id AND
    station_id = param_destination_station_id AND
    train_id = 1 AND
    departure_time > var_origin_departure_time;

  -- Calculate the travel time
  SET param_travel_time = TIMEDIFF(var_destination_departure_time, var_origin_departure_time);
END;
//
DELIMITER ;

CALL CalculateTravelTime(4, 1, 5, @travel_time);
SELECT @travel_time;


