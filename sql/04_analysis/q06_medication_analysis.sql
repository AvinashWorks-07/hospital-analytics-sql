
SELECT
    code,
    description,
    COUNT(*) AS medication_records,
    COUNT(DISTINCT patient_id) AS unique_patients,
    ROUND(AVG(total_cost), 2) AS avg_total_cost,
    ROUND(SUM(total_cost), 2) AS total_cost
FROM hospital.medications
GROUP BY code, description
ORDER BY medication_records DESC
LIMIT 20;
