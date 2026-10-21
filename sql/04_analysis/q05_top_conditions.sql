
SELECT
    code,
    description,
    COUNT(*) AS condition_records,
    COUNT(DISTINCT patient_id) AS unique_patients
FROM hospital.conditions
GROUP BY code, description
ORDER BY unique_patients DESC
LIMIT 20;
