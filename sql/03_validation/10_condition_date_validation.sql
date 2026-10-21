SELECT
    COUNT(*) AS invalid_condition_dates
FROM hospital.conditions
WHERE stop_date < start_date;