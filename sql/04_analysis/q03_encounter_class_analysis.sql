
SELECT
    encounter_class,
    COUNT(*) AS total_encounters,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage,
    ROUND(AVG(total_claim_cost), 2) AS avg_claim_cost,
    ROUND(SUM(total_claim_cost), 2) AS total_claim_cost
FROM hospital.encounters
GROUP BY encounter_class
ORDER BY total_encounters DESC;
