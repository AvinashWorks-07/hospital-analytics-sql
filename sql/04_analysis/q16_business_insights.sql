
SELECT
    COUNT(*) AS total_encounters,
    COUNT(DISTINCT patient_id) AS unique_patients,
    ROUND(AVG(total_claim_cost), 2) AS avg_claim_cost,
    ROUND(SUM(total_claim_cost), 2) AS total_claim_cost,
    ROUND(AVG(payer_coverage), 2) AS avg_payer_coverage,
    ROUND(
        100.0 * SUM(payer_coverage)
        / NULLIF(SUM(total_claim_cost), 0),
        2
    ) AS payer_coverage_pct,
    COUNT(*) FILTER (
        WHERE stop_time IS NULL
    ) AS encounters_without_stop_time
FROM hospital.encounters;
