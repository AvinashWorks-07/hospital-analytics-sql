
SELECT
    COUNT(*) AS total_encounters,
    ROUND(MIN(total_claim_cost), 2) AS minimum_claim,
    ROUND(AVG(total_claim_cost), 2) AS average_claim,
    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY total_claim_cost)::NUMERIC,
        2
    ) AS median_claim,
    ROUND(MAX(total_claim_cost), 2) AS maximum_claim,
    ROUND(SUM(total_claim_cost), 2) AS total_claim_cost
FROM hospital.encounters
WHERE total_claim_cost IS NOT NULL;

SELECT
    id AS encounter_id,
    patient_id,
    start_time,
    encounter_class,
    total_claim_cost
FROM hospital.encounters
WHERE total_claim_cost IS NOT NULL
ORDER BY total_claim_cost DESC
LIMIT 20;
