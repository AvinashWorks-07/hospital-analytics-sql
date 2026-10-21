
CREATE OR REPLACE VIEW hospital.vw_medication_summary AS
SELECT
    code AS medication_code,
    description AS medication_description,
    COUNT(*) AS prescription_records,
    COUNT(DISTINCT patient_id) AS unique_patients,
    ROUND(AVG(total_cost), 2) AS avg_total_cost,
    ROUND(SUM(total_cost), 2) AS total_medication_cost
FROM hospital.medications
GROUP BY code, description;
