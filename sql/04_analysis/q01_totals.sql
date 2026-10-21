
SELECT
    (SELECT COUNT(*) FROM hospital.patients) AS total_patients,
    (SELECT COUNT(*) FROM hospital.encounters) AS total_encounters,
    (SELECT COUNT(*) FROM hospital.conditions) AS total_condition_records,
    (SELECT COUNT(*) FROM hospital.medications) AS total_medication_records,
    (SELECT COUNT(*) FROM hospital.procedures) AS total_procedure_records,
    (SELECT MIN(start_time) FROM hospital.encounters) AS first_encounter,
    (SELECT MAX(start_time) FROM hospital.encounters) AS last_encounter;
