
SELECT 'encounters' AS table_name, COUNT(*) AS negative_cost_rows
FROM hospital.encounters
WHERE base_encounter_cost < 0
   OR total_claim_cost < 0
UNION ALL
SELECT 'medications', COUNT(*)
FROM hospital.medications
WHERE base_cost < 0 OR total_cost < 0
UNION ALL
SELECT 'procedures', COUNT(*)
FROM hospital.procedures
WHERE base_cost < 0;
