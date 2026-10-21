SELECT
    COUNT(*) AS total_encounters,
    COUNT(*) FILTER (WHERE patient_id IS NULL) AS missing_patient_id,
    COUNT(*) FILTER (WHERE start_time IS NULL) AS missing_start_time,
    COUNT(*) FILTER (WHERE encounter_class IS NULL) AS missing_encounter_class,
    COUNT(*) FILTER (WHERE total_claim_cost IS NULL) AS missing_claim_cost
FROM hospital.encounters;