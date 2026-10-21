
CREATE OR REPLACE VIEW hospital.vw_patient_demographics AS
SELECT
    state,
    gender,
    COUNT(*) AS total_patients,
    ROUND(AVG(
        EXTRACT(YEAR FROM AGE(CURRENT_DATE, birthdate))
    ), 1) AS avg_age_years
FROM hospital.patients
WHERE birthdate IS NULL OR birthdate <= CURRENT_DATE
GROUP BY state, gender;
