
CREATE OR REPLACE VIEW hospital.vw_condition_summary AS
SELECT
    code AS condition_code,
    description AS condition_description,
    COUNT(*) AS condition_records,
    COUNT(DISTINCT patient_id) AS unique_patients
FROM hospital.conditions
GROUP BY code, description;
