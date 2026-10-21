
CREATE OR REPLACE VIEW hospital.vw_data_quality_summary AS
SELECT
    'patients' AS table_name,
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE id IS NULL) AS null_ids
FROM hospital.patients

UNION ALL

SELECT 'encounters', COUNT(*),
       COUNT(*) FILTER (WHERE id IS NULL)
FROM hospital.encounters

UNION ALL

SELECT 'conditions', COUNT(*),
       COUNT(*) FILTER (WHERE patient_id IS NULL)
FROM hospital.conditions

UNION ALL

SELECT 'medications', COUNT(*),
       COUNT(*) FILTER (WHERE patient_id IS NULL)
FROM hospital.medications

UNION ALL

SELECT 'procedures', COUNT(*),
       COUNT(*) FILTER (WHERE patient_id IS NULL)
FROM hospital.procedures;
