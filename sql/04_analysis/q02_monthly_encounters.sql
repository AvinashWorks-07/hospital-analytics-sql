
SELECT
    DATE_TRUNC('month', start_time)::DATE AS encounter_month,
    COUNT(*) AS total_encounters,
    ROUND(AVG(total_claim_cost), 2) AS avg_claim_cost,
    ROUND(SUM(total_claim_cost), 2) AS total_claim_cost
FROM hospital.encounters
WHERE start_time IS NOT NULL
GROUP BY DATE_TRUNC('month', start_time)::DATE
ORDER BY encounter_month;

