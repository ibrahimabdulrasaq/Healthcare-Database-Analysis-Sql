# Healthcare Database Analysis - Deeptech Ready

This repository contains a MySQL healthcare database project that demonstrates how to:

- Create and populate tables for patients, doctors, and appointments.
  
- Perform data retrieval, filtering, and aggregation queries.
  
- Analyze patient demographics and doctor appointment data.
  
- Use SQL JOINs to combine tables and extract meaningful insights.
  
It is designed as a learning and reference project for SQL beginners.

---

## Project Overview
This project demonstrates SQL queries on a healthcare database that stores information about patients, doctors, and appointments. The goal is to:

- Analyze patient demographics

- Retrieve counts by gender

- Identify doctors with confirmed appointments

The database is built in MySQL, and the queries include SELECT, JOIN, GROUP BY, and filtering operations.

---

## Key Features:
- Fully documented SQL script with explanations and sample outputs.
  
- Queries grouped logically for easy understanding.

- Ready-to-run database creation and data insertion scripts.

---

## Technologies:
- MySQL

- SQL (SELECT, JOIN, GROUP BY, WHERE)

---

## Database Schema

### **Patients Table**

Stores information about patients.

| Column    | Data Type | Description                  |
| --------- | --------- | ---------------------------- |
| PatientID | INT       | Primary key                  |
| Name      | VARCHAR   | Patient's full name          |
| Age       | INT       | Patient's age                |
| Gender    | CHAR(1)   | 'M' for Male, 'F' for Female |
| State     | VARCHAR   | State where patient resides  |

**Sample Data:**

| PatientID | Name           | Age | Gender | State     |
| --------- | -------------- | --- | ------ | --------- |
| 10001     | Jonathan Aminu | 34  | M      | Jigawa    |
| 10111     | Kangyang Bot   | 27  | F      | Plateau   |
| 11111     | John Adamu     | 35  | M      | Fct Abuja |

---

### **Doctors Table**

Stores information about doctors.

| Column     | Data Type | Description                  |
| ---------- | --------- | ---------------------------- |
| DoctorID   | INT       | Primary key                  |
| Name       | VARCHAR   | Doctor's full name           |
| Speciality | VARCHAR   | Doctor's specialty           |
| State      | VARCHAR   | State where doctor practices |

**Sample Data:**

| DoctorID | Name              | Speciality  | State       |
| -------- | ----------------- | ----------- | ----------- |
| 32011    | Dr. John Olu      | Cardiology  | Nasarawa    |
| 32013    | Dr. Baker John    | Neurology   | Cross River |
| 32015    | Dr. Anita Chinedu | Dermatology | Abia        |

---

### **Appointments Table**

Stores information about patient appointments with doctors.

| Column          | Data Type | Description                            |
| --------------- | --------- | -------------------------------------- |
| AppointmentID   | INT       | Primary key                            |
| PatientID       | INT       | References patient                     |
| DoctorID        | INT       | References doctor                      |
| AppointmentDate | DATE      | Appointment date                       |
| Status          | VARCHAR   | Appointment status (Pending/Confirmed) |

**Sample Data:**

| AppointmentID | PatientID | DoctorID | Date       | Status    |
| ------------- | --------- | -------- | ---------- | --------- |
| 20101         | 12003     | 32013    | 2024-10-12 | Confirmed |
| 20102         | 10111     | 32013    | 2024-11-30 | Confirmed |
| 20107         | 11111     | 32015    | 2024-12-05 | Confirmed |

---

## Queries

### 1. View All Patients

```sql
SELECT * FROM patient;
```
**Expected Output:**

<img width="346" height="110" alt="image" src="https://github.com/user-attachments/assets/e58d6205-4364-429e-befe-ba2e480c712c" />

---

### 2. View All Doctors

```sql
SELECT * FROM doctor;
```
**Expected Output:**

<img width="339" height="116" alt="image" src="https://github.com/user-attachments/assets/d45bf802-ae4a-40c3-a72e-9b10829eaed0" />

---

### 3. View All Appointments

```sql
SELECT * FROM appointments;
```
**Expected Output:**

<img width="404" height="117" alt="image" src="https://github.com/user-attachments/assets/5fe59e2a-4ac3-49de-8310-65d698ecb9c1" />

---

### 4. Patients in Fct Abuja and Plateau

Retrieve all patients who reside in **Fct Abuja** or **Plateau**.

```sql
SELECT *
FROM patient
WHERE State IN ('Fct Abuja', 'Plateau');
```

**Expected Output:**

| PatientID | Name         | Age | Gender | State     |
| --------- | ------------ | --- | ------ | --------- |
| 10111     | Kangyang Bot | 27  | F      | Plateau   |
| 11111     | John Adamu   | 35  | M      | Fct Abuja |

<img width="331" height="54" alt="image" src="https://github.com/user-attachments/assets/699bd652-f204-4800-b539-2b8ee2310711" />

---

### 5. Total Male and Female Patients

Count patients grouped by gender.

```sql
SELECT Gender, COUNT(PatientID) AS TotalPatients
FROM patient
GROUP BY Gender;
```

**Expected Output:**

| Gender | TotalPatients |
| ------ | ------------- |
| M      | 4             |
| F      | 4             |

<img width="198" height="36" alt="image" src="https://github.com/user-attachments/assets/f5a6c48a-2a93-49dc-b8ec-449a0e6961e0" />

---

### 6. Doctors with Confirmed Appointments

Retrieve doctors who have at least one confirmed appointment.

```sql
SELECT DISTINCT d.Name AS DoctorName, d.Speciality, d.State
FROM doctor d
JOIN appointments a ON d.DoctorID = a.DoctorID
WHERE a.Status = 'Confirmed';
```

**Expected Output:**

| DoctorName        | Speciality  | State       |
| ----------------- | ----------- | ----------- |
| Dr. Baker John    | Neurology   | Cross River |
| Dr. Anita Chinedu | Dermatology | Abia        |

<img width="275" height="78" alt="image" src="https://github.com/user-attachments/assets/f9d33e92-2b69-4e51-bc4a-e8d152e9e758" />

---

## Summary

This project demonstrates how to:

* Create and populate a healthcare database
* Perform filtering, aggregation, and joins
* Analyze patient demographics and doctor appointments

It can be used as a reference project for SQL practice.

---

## Author

Ibrahim Abdulrasaq

Data Analyst | BI Specialist

---

## Contact

Connect with me here:

🔗 [Email](mailto:ibrahimabdulrasaqademola2017@gmail.com)

🔗 [LinkedIn](https://www.linkedin.com/in/ibrahim-abdulrasaq/)

🔗 [Github](https://github.com/ibrahimabdulrasaq)


