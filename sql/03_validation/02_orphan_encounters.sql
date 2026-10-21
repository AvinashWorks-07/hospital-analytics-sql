
SELECT COUNT(*) AS orphan_encounters
FROM hospital.encounters e
LEFT JOIN hospital.patients p
    ON e.patient_id = p.id
WHERE p.id IS NULL;
