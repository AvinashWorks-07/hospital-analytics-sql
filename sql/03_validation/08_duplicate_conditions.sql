SELECT
    patient_id,
    encounter_id,
    code,
    start_date,
    COUNT(*) AS duplicate_count
FROM hospital.conditions
GROUP BY
    patient_id,
    encounter_id,
    code,
    start_date
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;