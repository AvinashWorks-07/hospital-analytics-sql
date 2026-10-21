
SELECT COUNT(*) AS invalid_medication_dates
FROM hospital.medications
WHERE stop_time < start_time;
