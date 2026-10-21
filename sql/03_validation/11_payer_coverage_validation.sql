SELECT
    COUNT(*) AS total_encounters,
    COUNT(*) FILTER (WHERE payer_coverage < 0) AS negative_coverage,
    COUNT(*) FILTER (
        WHERE payer_coverage > total_claim_cost
    ) AS coverage_exceeds_claim
FROM hospital.encounters;