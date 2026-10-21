
SELECT COUNT(*) AS orphan_conditions
FROM hospital.conditions c
LEFT JOIN hospital.patients p
    ON c.patient_id = p.id
WHERE p.id IS NULL;
