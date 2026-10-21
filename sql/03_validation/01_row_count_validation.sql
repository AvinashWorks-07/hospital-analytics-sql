
SELECT 'patients' AS table_name, COUNT(*) AS row_count
FROM hospital.patients
UNION ALL
SELECT 'organizations', COUNT(*) FROM hospital.organizations
UNION ALL
SELECT 'providers', COUNT(*) FROM hospital.providers
UNION ALL
SELECT 'payers', COUNT(*) FROM hospital.payers
UNION ALL
SELECT 'encounters', COUNT(*) FROM hospital.encounters
UNION ALL
SELECT 'conditions', COUNT(*) FROM hospital.conditions
UNION ALL
SELECT 'medications', COUNT(*) FROM hospital.medications
UNION ALL
SELECT 'observations', COUNT(*) FROM hospital.observations
UNION ALL
SELECT 'procedures', COUNT(*) FROM hospital.procedures;
