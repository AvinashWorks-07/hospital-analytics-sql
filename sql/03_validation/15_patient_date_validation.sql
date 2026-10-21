
SELECT COUNT(*) AS invalid_patient_dates
FROM hospital.patients
WHERE birthdate > CURRENT_DATE
   OR deathdate < birthdate
   OR deathdate > CURRENT_DATE;
