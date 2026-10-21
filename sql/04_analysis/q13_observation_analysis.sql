
SELECT
    observation_type,
    COUNT(*) AS observation_count,
    COUNT(DISTINCT patient_id) AS unique_patients,
    COUNT(value) AS non_null_values
FROM hospital.observations
GROUP BY observation_type
ORDER BY observation_count DESC;

SELECT
    code,
    description,
    units,
    COUNT(*) AS observation_count
FROM hospital.observations
GROUP BY code, description, units
ORDER BY observation_count DESC
LIMIT 20;
