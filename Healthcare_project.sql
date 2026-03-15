-- 	Create a healthcare database
CREATE DATABASE healthcare;

-- Set as current database
USE healthcare;

-- Create patient table
CREATE TABLE patient(
PatientID 	INT PRIMARY KEY,
Name		VARCHAR(50) NOT NULL,
Age 		INT,
Gender 		CHAR(1) NOT NULL,
State		VARCHAR(30) NOT NULL
);

-- Insert values into patient table column
INSERT INTO patient(PatientID, Name, Age, Gender, State) VALUES
(10001,	'Jonathan Aminu', 34, 'M', 'Jigawa'),
(10110,	'Abubakar Sani', 45, 'M', 'Kano'),
(10111,	'Kangyang Bot',	27,	'F', 'Plateau'),
(11111,	'John Adamu',	35,	'M', 'Fct Abuja'),
(12003,	'Kemi Adebayo',	57,	'F', 'Ogun'),
(11320,	'Esther Ugo',	28,	'F', 'Anambra'),
(34352,	'Agatha Uma',	37,	'F', 'Bayelsa'),
(45789,	'Mike Udo',	45,	'M', 'Akwa Ibom');
				
SELECT *
FROM patient;

-- Create doctor table
CREATE TABLE doctor(
doctorid 	INT PRIMARY KEY,
Name		VARCHAR(50) NOT NULL,
Speciality  VARCHAR(30) NOT NULL,
State		VARCHAR(30) NOT NULL
);

-- Insert Values into doctor table
INSERT INTO doctor VALUES
(32011,	'Dr. John Olu', 'Cardiology', 'Nasarawa'),
(32013,	'Dr. Baker John', 'Neurology', 'Cross River'),
(32014,	'Dr. Aminu Abdul', 'Orthopedics', 'Sokoto'),
(32015,	'Dr. Anita Chinedu', 'Dermatology', 'Abia'),
(32016,	'Dr. Esther Job', 'Ophtalmology', 'Ekiti');

SELECT *
FROM doctor;

-- Create appointment table
CREATE TABLE appointments (
    AppointmentID INT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES patient(PatientID),
    FOREIGN KEY (doctorid) REFERENCES doctor(doctorid)
);

-- Inserting values into appointment table column
INSERT INTO appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, Status)
VALUES 
    (20101, 12003, 32013, '2024-10-12', 'Confirmed'),
    (20102, 10111, 32013, '2024-11-30', 'Confirmed'),
    (20103, 34352, 32015, '2025-01-24', 'Pending'),
    (20107, 11111, 32015, '2024-12-05', 'Confirmed'),
    (20109, 12003, 32014, '2025-02-09', 'Pending'),
    (20106, 11320, 32011, '2025-01-06', 'Pending');
    
    SELECT * 
    FROM appointments
;

-- Find all the patients in the state “Fct Abuja”, ”Plateau”
SELECT * 
FROM patient
WHERE state IN ('Fct Abuja', 'Plateau');

-- Retrieve the total number of male and female patients
SELECT  gender, COUNT(patientID) AS Total_no_of_patients
FROM patient
GROUP BY gender;

-- Write a query to list doctors and their specialties in state where confirmed appointments exist.
SELECT * FROM doctor;
SELECT * FROM appointments;

SELECT d.Name, d.Speciality, a.Status
FROM doctor d
JOIN appointments a
ON d.doctorid=a.doctorid
WHERE Status='confirmed';