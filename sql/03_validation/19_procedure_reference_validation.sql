
SELECT
    COUNT(*) FILTER (
        WHERE p.id IS NULL
    ) AS orphan_patient_refs,
    COUNT(*) FILTER (
        WHERE e.id IS NULL AND pr.encounter_id IS NOT NULL
    ) AS orphan_encounter_refs
FROM hospital.procedures pr
LEFT JOIN hospital.patients p
    ON pr.patient_id = p.id
LEFT JOIN hospital.encounters e
    ON pr.encounter_id = e.id;
