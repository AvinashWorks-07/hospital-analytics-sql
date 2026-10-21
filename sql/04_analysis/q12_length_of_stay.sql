
SELECT
    encounter_class,
    COUNT(*) AS valid_encounters,
    ROUND(
        AVG(EXTRACT(EPOCH FROM (stop_time - start_time)) / 3600)::NUMERIC,
        2
    ) AS avg_duration_hours,
    ROUND(
        MAX(EXTRACT(EPOCH FROM (stop_time - start_time)) / 3600)::NUMERIC,
        2
    ) AS max_duration_hours
FROM hospital.encounters
WHERE start_time IS NOT NULL
  AND stop_time IS NOT NULL
  AND stop_time >= start_time
GROUP BY encounter_class
ORDER BY avg_duration_hours DESC NULLS LAST;
