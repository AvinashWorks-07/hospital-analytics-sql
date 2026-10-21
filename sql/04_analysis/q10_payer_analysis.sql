
SELECT
    p.id AS payer_id,
    p.name AS payer_name,
    COUNT(e.id) AS total_encounters,
    ROUND(SUM(e.total_claim_cost), 2) AS total_claim_cost,
    ROUND(SUM(e.payer_coverage), 2) AS total_payer_coverage,
    ROUND(
        100.0 * SUM(e.payer_coverage)
        / NULLIF(SUM(e.total_claim_cost), 0),
        2
    ) AS coverage_percentage
FROM hospital.payers p
LEFT JOIN hospital.encounters e
    ON e.payer_id = p.id
GROUP BY p.id, p.name
ORDER BY total_claim_cost DESC NULLS LAST;
