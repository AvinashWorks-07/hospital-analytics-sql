SELECT
    COUNT(*) AS total_patients,
    COUNT(*) FILTER (WHERE birthdate IS NULL) AS missing_birthdate,
    COUNT(*) FILTER (WHERE gender IS NULL) AS missing_gender,
    COUNT(*) FILTER (WHERE city IS NULL) AS missing_city,
    COUNT(*) FILTER (WHERE healthcare_expenses IS NULL) AS missing_expenses
FROM hospital.patients;