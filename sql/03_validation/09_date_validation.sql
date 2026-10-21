SELECT
    COUNT(*) AS invalid_encounter_dates
FROM hospital.encounters
WHERE stop_time < start_time;