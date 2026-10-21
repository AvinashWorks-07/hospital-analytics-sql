
SELECT
    code,
    description,
    COUNT(*) AS procedure_count,
    COUNT(DISTINCT patient_id) AS unique_patients,
    ROUND(AVG(base_cost), 2) AS avg_base_cost,
    ROUND(SUM(base_cost), 2) AS total_base_cost
FROM hospital.procedures
GROUP BY code, description
ORDER BY procedure_count DESC
LIMIT 20;
