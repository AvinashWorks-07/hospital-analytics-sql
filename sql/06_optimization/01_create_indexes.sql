
-- 1. Encounter date analysis
CREATE INDEX IF NOT EXISTS idx_encounters_start_time
ON hospital.encounters (start_time);

-- 2. Patient encounter lookup
CREATE INDEX IF NOT EXISTS idx_encounters_patient_id
ON hospital.encounters (patient_id);

-- 3. Provider encounter analysis
CREATE INDEX IF NOT EXISTS idx_encounters_provider_id
ON hospital.encounters (provider_id);

-- 4. Organization encounter analysis
CREATE INDEX IF NOT EXISTS idx_encounters_organization_id
ON hospital.encounters (organization_id);

-- 5. Payer encounter analysis
CREATE INDEX IF NOT EXISTS idx_encounters_payer_id
ON hospital.encounters (payer_id);

-- 6. Patient condition lookup
CREATE INDEX IF NOT EXISTS idx_conditions_patient_id
ON hospital.conditions (patient_id);

-- 7. Medication patient lookup
CREATE INDEX IF NOT EXISTS idx_medications_patient_id
ON hospital.medications (patient_id);

-- 8. Procedure patient lookup
CREATE INDEX IF NOT EXISTS idx_procedures_patient_id
ON hospital.procedures (patient_id);

-- 9. Observation patient lookup
CREATE INDEX IF NOT EXISTS idx_observations_patient_id
ON hospital.observations (patient_id);

-- Update planner statistics
ANALYZE hospital.encounters;
ANALYZE hospital.conditions;
ANALYZE hospital.medications;
ANALYZE hospital.procedures;
ANALYZE hospital.observations;
