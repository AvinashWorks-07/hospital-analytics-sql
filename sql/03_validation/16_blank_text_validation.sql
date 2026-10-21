
SELECT
    COUNT(*) FILTER (
        WHERE NULLIF(TRIM(city), '') IS NULL
    ) AS blank_patient_city,
    COUNT(*) FILTER (
        WHERE NULLIF(TRIM(gender), '') IS NULL
    ) AS blank_patient_gender,
    COUNT(*) FILTER (
        WHERE NULLIF(TRIM(state), '') IS NULL
    ) AS blank_patient_state
FROM hospital.patients;
