
CREATE OR REPLACE VIEW hospital.vw_encounter_class_summary AS
SELECT
    encounter_class,
    COUNT(*) AS total_encounters,
    COUNT(DISTINCT patient_id) AS unique_patients,
    ROUND(AVG(total_claim_cost), 2) AS avg_claim_cost,
    ROUND(SUM(total_claim_cost), 2) AS total_claim_cost
FROM hospital.encounters
GROUP BY encounter_class;
