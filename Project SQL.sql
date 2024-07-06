-- Group Members
-- Asawer Javed (L1F21BSCS1303)
-- Nabeera Ejaz (L1F21BSCS0741)
-- Esha Maryam (L1F21BSCS0607)

CREATE DATABASE EventHub;
USE EventHub;
-- 1. Create tables

-- Organizers table
CREATE TABLE Organizers 
(
  organizer_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  email VARCHAR(255),
  role VARCHAR(100)
);

-- Event Categories table
CREATE TABLE EventCategories 
(
  category_id INT PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(255)
);

-- Events table
CREATE TABLE Events 
(
  event_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  date DATE,
  time TIME,
  location VARCHAR(255),
  fee INT,
  organizer_Id INT,
  category_id INT,
  FOREIGN KEY (organizer_Id) REFERENCES Organizers(organizer_Id),
  FOREIGN KEY (category_id) REFERENCES EventCategories(category_id)
);

-- Attendees table
CREATE TABLE Attendees 
(
  attendee_id INT PRIMARY KEY AUTO_INCREMENT,
  event_id INT,
  name VARCHAR(255),
  email VARCHAR(255),
  FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- Registrations table
CREATE TABLE Registrations 
(
  registration_id INT PRIMARY KEY AUTO_INCREMENT,
  attendee_id INT,
  event_id INT,
  registration_date DATE,
  payment_status VARCHAR(50),
  FOREIGN KEY (attendee_id) REFERENCES Attendees(attendee_id),
  FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- Venues table
CREATE TABLE Venues 
(
  venue_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  address VARCHAR(255),
  capacity INT,
  availability VARCHAR(50),
  event_id INT DEFAULT NULL,
  FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- Schedules table
CREATE TABLE Schedules 
(
  schedule_id INT PRIMARY KEY AUTO_INCREMENT,
  event_id INT,
  session_title VARCHAR(255),
  start_time TIME,
  end_time TIME,
  speaker VARCHAR(255),
  FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- Speakers table
CREATE TABLE Speakers 
(
  speaker_id INT PRIMARY KEY AUTO_INCREMENT,
  event_id INT,
  name VARCHAR(255),
  expertise VARCHAR(255),
  topic VARCHAR(255),
  FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- Sponsors table
CREATE TABLE Sponsors 
(
  sponsor_id INT PRIMARY KEY AUTO_INCREMENT,
  event_id INT,
  name VARCHAR(255),
  sponsorship_level VARCHAR(100),
  FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- Event Feedback table
CREATE TABLE EventFeedback 
(
  feedback_id INT PRIMARY KEY AUTO_INCREMENT,
  event_id INT,
  attendee_id INT,
  rating INT,
  comment VARCHAR(255),
  FOREIGN KEY (event_id) REFERENCES Events(event_id),
  FOREIGN KEY (attendee_id) REFERENCES Attendees(attendee_id)
);

-- Insert data into the tables

-- Insert into Organizers table
INSERT INTO Organizers (name, email, role)
VALUES
  ('John Doe', 'johndoe@example.com', 'Event Manager'),
  ('Jane Smith', 'janesmith@example.com', 'Event Coordinator'),
  ('Michael Johnson', 'michaeljohnson@example.com', 'Event Planner'),
  ('Emily Davis', 'emilydavis@example.com', 'Event Administrator'),
  ('David Wilson', 'davidwilson@example.com', 'Event Director'),
  ('Alicia Zeyla', 'alicia@example.com', 'Event Manager'),
  ('Lara Jones', 'larajones@example.com', 'Event Planner'),
  ('James Bond', 'jamesbond@example.com', 'Event Planner');

-- Insert into EventCategories table
INSERT INTO EventCategories (category_name)
VALUES
  ('Technology'),
  ('Birthday'),
  ('Business'),
  ('Marketing'),
  ('Education'),
  ('Wedding');

-- Insert into Events table
INSERT INTO Events (title, date, time, location, fee, organizer_Id, category_id)
VALUES
  ('Tech Conference', '2022-06-10', '09:00:00', 'Conference Hall A', 1000, 1, 1),
  ('Birthday Party', '2019-12-13', '16:00:00', 'Empire Marquee', 0, 5, 2),
  ('Business Workshop', '2020-08-15', '14:00:00', 'Workshop Room B', 5000, 2, 3),
  ('Marketing Seminar', '2021-01-20', '11:00:00', 'Seminar Hall C', 3000, 3, 4),
  ('Web Development Webinar', '2020-10-25', '18:00:00', 'Online', 2500, 4, 5),
  ('Wedding Ceremony', '2019-12-30', '16:00:00', 'Lahore Castle', 0, 5, 6),
  ('Nikkah Ceremony', '2023-04-30', '16:00:00', 'Lahore Garison', 0, 5, 6);

-- Insert into Venues table
INSERT INTO Venues (name, address, capacity, availability, event_id)
VALUES
  ('Conference Hall A', '123 Central Park Lane, New York', 50, 'Booked', 1),
  ('Empire Marquee', '46 Johar Town, Lahore', 50, 'Booked', 2),
  ('Workshop Room B', '123 Main Street, Lahore', 500, 'Booked', 3),
  ('Seminar Hall C', '456 Park Avenue, New York', 200, 'Booked', 4),
  ('Exhibition Center', '789 Elm Road, California', 1000, 'Available', NULL),
  ('Prime Marquee', '654 Pine Street, Washington', 150, 'Available', NULL),
  ('Lahore Garison', '321 Farooq Street, Lahore', 50, 'Booked', 7),
  ('Lahore Castle', '55 Punjab Society, Lahore', 50, 'Booked', 6);

-- Insert into Attendees table
INSERT INTO Attendees (event_id, name, email)
VALUES
  (1, 'Alice Johnson', 'alicejohnson@example.com'),
  (1, 'Bob Smith', 'bobsmith@example.com'),
  (2, 'Carol Davis', 'caroldavis@example.com'),
  (6, 'Daniel Wilson', 'danielwilson@example.com'),
  (3, 'Emma Thompson', 'emmathompson@example.com'),
  (7, 'Michael Brown', 'michaelbrown@example.com'),
  (7, 'Michael Jackson', 'michaeljackson@example.com'),
  (4, 'Indiana Jones', 'indianajones@example.com');
  
  -- Insert into EventFeedback table
INSERT INTO EventFeedback (event_id, attendee_id, rating, comment)
VALUES
  (1, 1, 5, 'The conference was well-organized and the speakers were excellent.'),
  (4, 8, 4, 'Good selection of topics and informative sessions.'),
  (2, 3, 3, 'The workshop could have been more interactive.'),
  (3, 5, 5, 'Great workshop with practical insights.');

-- Insert into Registrations table
INSERT INTO Registrations (attendee_id, event_id, registration_date, payment_status)
VALUES
  (1, 1, '2022-06-01', 'Paid'),
  (2, 1, '2022-06-03', 'Paid'),
  (3, 2, '2019-12-05', 'Pending'),
  (4, 6, '2019-11-30', 'Pending'),
  (5, 3, '2020-08-11', 'Paid'),
  (6, 7, '2023-04-15', 'Paid'),
  (7, 7, '2023-04-12', 'Pending'),
  (8, 4, '2020-12-20', 'Paid');

-- Insert into Schedules table
INSERT INTO Schedules (event_id, session_title, start_time, end_time, speaker)
VALUES
  (1, 'Introduction to AI', '10:00:00', '12:00:00', 'Dr. Robert Green'),
  (1, 'Latest Trends in Technology', '14:00:00', '16:00:00', 'John Smith'),
  (3, 'Business Strategy Workshop', '15:00:00', '17:00:00', 'Sarah Johnson'),
  (4, 'Marketing Tactics', '16:00:00', '17:00:00', 'Emily Davis'),
  (4, 'Effective Marketing Campaigns', '13:00:00', '15:00:00', 'Michael Brown');

-- Insert into Speakers table
INSERT INTO Speakers (event_id, name, expertise, topic)
VALUES
  (1, 'Dr. Robert Green', 'AI Expert', 'Artificial Intelligence'),
  (1, 'John Smith', 'Technology Enthusiast', 'Technology Trends'),
  (3, 'Sarah Johnson', 'Business Consultant', 'Business Strategy'),
  (4, 'Emily Davis', 'Marketing Professional', 'Marketing Tactics'),
  (4, 'Michael Brown', 'Marketing Guru', 'Effective Marketing');

-- Insert into Sponsors table
INSERT INTO Sponsors (event_id, name, sponsorship_level)
VALUES
  (1, 'Tech Solutions Inc.', 'Gold'),
  (4, 'Marketing Innovators Ltd.', 'Silver'),
  (3, 'Global Services Co.', 'Bronze'),
  (1, 'Software Enterprises', 'Platinum'),
  (4, 'Consulting Experts LLC', 'Gold');