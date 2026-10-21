
-- Query 1: Monthly encounter analysis
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    DATE_TRUNC('month', start_time)::DATE AS encounter_month,
    COUNT(*) AS total_encounters,
    ROUND(AVG(total_claim_cost), 2) AS avg_claim_cost
FROM hospital.encounters
WHERE start_time IS NOT NULL
GROUP BY DATE_TRUNC('month', start_time)::DATE
ORDER BY encounter_month;


-- Query 2: Patient-specific encounter lookup
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    id,
    patient_id,
    start_time,
    encounter_class,
    total_claim_cost
FROM hospital.encounters
WHERE patient_id = '1d604da9-9a81-4ba9-80c2-de3375d59b40'::UUID
ORDER BY start_time DESC;
