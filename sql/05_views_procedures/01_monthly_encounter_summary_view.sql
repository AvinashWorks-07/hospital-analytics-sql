
CREATE OR REPLACE VIEW hospital.vw_monthly_encounter_summary AS
SELECT
    DATE_TRUNC('month', start_time)::DATE AS encounter_month,
    COUNT(*) AS total_encounters,
    COUNT(DISTINCT patient_id) AS unique_patients,
    ROUND(AVG(total_claim_cost), 2) AS avg_claim_cost,
    ROUND(SUM(total_claim_cost), 2) AS total_claim_cost,
    ROUND(SUM(payer_coverage), 2) AS total_payer_coverage
FROM hospital.encounters
WHERE start_time IS NOT NULL
GROUP BY DATE_TRUNC('month', start_time)::DATE;
