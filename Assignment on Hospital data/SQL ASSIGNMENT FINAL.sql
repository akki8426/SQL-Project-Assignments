CREATE TABLE HOSPITAL_DATA(
Hospital_ID	INT PRIMARY KEY,
Hospital_Name VARCHAR(100),
Location	VARCHAR(100),
Department	VARCHAR(100),	
Doctors_Count	INT,
Patients_Count	INT,	
Admission_Date	DATE,	
Discharge_Date	DATE,	
Medical_Expenses FLOAT);

SELECT * FROM HOSPITAL_DATA;
DESC HOSPITAL_DATA;

# 1. Write an SQL query to find the total number of patients across all hospitals.
SELECT SUM(PATIENTS_COUNT) AS TOTAL_NUMBER_OF_PATIENTS FROM HOSPITAL_DATA;

# 2. Retrieve the average count of doctors available in each hospital.
SELECT HOSPITAL_NAME, AVG(DOCTORS_COUNT) AS AVERAGE_COUNT_OF_DOCTORS
FROM HOSPITAL_DATA
GROUP BY HOSPITAL_NAME;

# 3. Find the top 3 hospital departments that have the highest number of patients.
SELECT HOSPITAL_NAME, DEPARTMENT,PATIENTS_COUNT FROM HOSPITAL_DATA ORDER BY PATIENTS_COUNT DESC LIMIT 3;

# 4. Identify the hospital that recorded the highest medical expenses.
SELECT HOSPITAL_NAME, MEDICAL_EXPENSES AS HIGHEST_MEDICAL_EXPENSES
FROM HOSPITAL_DATA
ORDER BY MEDICAL_EXPENSES DESC LIMIT 1;

# 5. Calculate the average medical expenses per day for each hospital.
SELECT HOSPITAL_NAME, AVG(MEDICAL_EXPENSES) AS AVERAGE_EXPENSES_PER_DAY
FROM HOSPITAL_DATA
GROUP BY HOSPITAL_NAME;

# 6. Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
SELECT HOSPITAL_NAME, ADMISSION_DATE, DISCHARGE_DATE,
COALESCE(DISCHARGE_DATE) - COALESCE(ADMISSION_DATE) AS STAY_DURATION
FROM HOSPITAL_DATA
ORDER BY STAY_DURATION DESC
LIMIT 1;


# 7. Count the total number of patients treated in each city.
SELECT LOCATION, SUM(PATIENTS_COUNT) AS TOTAL_NUMBER_OF_PATIENTS 
FROM HOSPITAL_DATA
GROUP BY LOCATION;

# 8. Calculate the average number of days patients spend in each department.
SELECT DEPARTMENT,
AVG(COALESCE(DISCHARGE_DATE)-COALESCE(ADMISSION_DATE)) AS AVG_STAY_DURATION_DAYS
FROM HOSPITAL_DATA
GROUP BY DEPARTMENT;

# 9. Find the department with the least number of patients.
SELECT DEPARTMENT, PATIENTS_COUNT FROM HOSPITAL_DATA ORDER BY PATIENTS_COUNT LIMIT 1;

# 10. Group the data by month and calculate the total medical expenses for each month.
SELECT DATE_FORMAT(ADMISSION_DATE, '%Y-%m') AS MONTH,
SUM(MEDICAL_EXPENSES) AS TOTAL_MEDICAL_EXPENSES
FROM HOSPITAL_DATA
GROUP BY MONTH 
ORDER BY MONTH;




