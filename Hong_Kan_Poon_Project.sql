-- Create Line Table
CREATE TABLE IF NOT EXISTS Line (
    line_id INT AUTO_INCREMENT PRIMARY KEY,
    line_name VARCHAR(255) NOT NULL UNIQUE
);

-- Insert Data Into Line Table
INSERT INTO Line (line_name)
VALUES ('Line 1 - Yonge-University'),
       ('Line 2 - Bloor-Danforth'),
       ('Line 3 - Scarborough'),
       ('Line 4 - Sheppard')

-- Create Stations Table
CREATE TABLE IF NOT EXISTS Stations (
    station_id INT AUTO_INCREMENT PRIMARY KEY,
    station_name VARCHAR(255) NOT NULL UNIQUE
);

-- Insert Data Into Stations Table
INSERT INTO Stations (station_name)
VALUES ('Sheppard-Yonge'),
       ('Bayview'),
       ('Bessarion'),
       ('Leslie'),
       ('Don Mills');

-- Create Line_Stations Table
CREATE TABLE IF NOT EXISTS Line_Stations (
    lines_stations_id INT AUTO_INCREMENT PRIMARY KEY,
    line_id INT,
    station_id INT,
    FOREIGN KEY (line_id) REFERENCES Line(line_id) ON DELETE CASCADE,
    FOREIGN KEY (station_id) REFERENCES Stations(station_id) ON DELETE CASCADE
);

-- Insert Data Into Line_Stations Table
INSERT INTO Line_Stations (line_id, station_id)
VALUES (4, 1),
       (4, 2),
       (4, 3),
       (4, 4),
       (4, 5);

-- Create Trains Table
CREATE TABLE IF NOT EXISTS Trains (
    train_id INT AUTO_INCREMENT PRIMARY KEY,
    train_name VARCHAR(255) NOT NULL UNIQUE,
    line_id INT,
    FOREIGN KEY (line_id) REFERENCES Line(line_id) ON DELETE CASCADE
);

-- Insert Data Into Trains Table
INSERT INTO Trains (train_name, line_id)
VALUES ('Train 401', 4),
       ('Train 402', 4),
       ('Train 403', 4),
       ('Train 404', 4);

-- Create Schedules Table
CREATE TABLE IF NOT EXISTS Schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    line_id INT,
    station_id INT,
    train_id INT,
    direction VARCHAR(255),
    arrival_time TIME NOT NULL,
    delay TIME,
    FOREIGN KEY (line_id) REFERENCES Line(line_id) ON DELETE CASCADE,
    FOREIGN KEY (station_id) REFERENCES Stations(station_id) ON DELETE CASCADE,
    FOREIGN KEY (train_id) REFERENCES Trains(train_id) ON DELETE CASCADE
);

-- Insert Data Into Trains Table Manually
INSERT INTO Schedules (line_id, station_id, train_id, direction, arrival_time, delay)
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



-- Create A Procedure to Insert Train Schedules Automatically With 5 Minutes Time Difference
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
              INSERT INTO Schedules (line_id, station_id, train_id, direction, arrival_time, delay)
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
              INSERT INTO Schedules (line_id, station_id, train_id, direction, arrival_time, delay)
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
              INSERT INTO Schedules (line_id, station_id, train_id, direction, arrival_time, delay)
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
              INSERT INTO Schedules (line_id, station_id, train_id, direction, arrival_time, delay)
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

-- Calling The InsertTrainSchedule Procedure To Insert Train Schedules From 6:00am to 10:00pm
CALL InsertTrainSchedule(4, 1, 1, 5, '06:00:00', '22:00:00');
CALL InsertTrainSchedule(4, 2, 5, 1, '06:00:00', '22:00:00');
CALL InsertTrainSchedule(4, 3, 1, 5, '06:15:00', '22:15:00');
CALL InsertTrainSchedule(4, 4, 5, 1, '06:15:00', '22:15:00');

-- Create A Trigger to Detect Time Conflict of Train Schedules
DELIMITER //
CREATE TRIGGER check_arrival_time_update
BEFORE UPDATE ON Schedules
FOR EACH ROW
BEGIN
  DECLARE next_arrival_time TIME;
  
  SELECT arrival_time
  INTO next_arrival_time
  FROM Schedules
  -- I'm not checking the station because the station_id will change along like 1,2,3,4,5 and 5,4,3,2,1 
    WHERE line_id = NEW.line_id
    AND train_id = NEW.train_id
    AND arrival_time > OLD.arrival_time
  ORDER BY arrival_time ASC
  LIMIT 1;
  -- If the new arrival is greater or equal to the next arrival time, throws an error
  IF NEW.arrival_time >= next_arrival_time THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Error: Updated arrival time cannot be later than or equal to the arrival time of the next train.';
  END IF;
END;
//
DELIMITER ;

-- To Test The check_arrival_time_update Trigger
UPDATE Schedules 
  SET arrival_time = '09:05:00'
  WHERE schedule_id = 1

-- Create A Schedules_log Table
DROP TABLE IF EXISTS Schedules_log;
CREATE TABLE IF NOT EXISTS Schedules_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    action VARCHAR(255),
    schedule_id INT,
    line_id INT,
    station_id INT,
    train_id INT,
    direction VARCHAR(255),
    arrival_time_new TIME,
    arrival_time_old TIME,
    timestamp TIMESTAMP
);  

-- Create Trigger To Log When Deleting A Schedule
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
      arrival_time_old,
      timestamp
    )
    VALUES (
      'DELETE',
      OLD.schedule_id,
      OLD.line_id,
      OLD.station_id,
      OLD.train_id,
      OLD.direction,
      OLD.arrival_time,
      NOW()
    );
  END; //
DELIMITER ;

-- Testing the log_schedule_deletion Trigger
DELETE FROM Schedules 
  WHERE schedule_id = 1;

-- Create Function To Return The Updated Arrival Time After Delay For A Train
DROP FUNCTION IF EXISTS UpdateArrivalTimeWithDelay;
DELIMITER //
CREATE FUNCTION UpdateArrivalTimeWithDelay(
  param_train_id INT,
  original_arrival_time TIME
) RETURNS TIME
BEGIN
  DECLARE total_delay_seconds INT;
  
  -- Check for delays on the same train and sum them up in seconds
  SELECT SUM(TIME_TO_SEC(delay))
  INTO total_delay_seconds
  FROM Schedules
  WHERE train_id = param_train_id;

  -- If there is no delay or the total delay is 0, return the original arrival time
  IF total_delay_seconds IS NULL OR total_delay_seconds = 0 THEN
    RETURN original_arrival_time;
  END IF;

  -- Calculate the new arrival time after applying the total delay
  RETURN ADDTIME(original_arrival_time, SEC_TO_TIME(total_delay_seconds));
END;
//
DELIMITER ;

-- Set A Delay to Train 401
UPDATE Schedules 
	SET delay = '00:00:30'
	WHERE schedule_id = 2

-- Show The Next Five Train Schedules At Bayview Station To Eastbound FROM 9:00AM 
CREATE VIEW next_five_schedules_Bessarion_Eastbound AS
  SELECT
      l.line_name,
      st.station_name,
      t.train_name,
      s.arrival_time,
      UpdateArrivalTimeWithDelay(s.train_id, s.arrival_time) AS updated_arrival_time,
      s.direction
  FROM Schedules s
    JOIN Line l ON s.line_id = l.line_id
    JOIN Stations st ON s.station_id = st.station_id
    JOIN Trains t ON s.train_id = t.train_id
  WHERE
    l.line_id = 4 AND
    st.station_name = "Bayview" AND 
      s.arrival_time >= "06:00:00" AND
      s.direction = "Eastbound"
  ORDER BY
      s.arrival_time
  LIMIT 5;