
WITH inpatient_encounters AS (
    SELECT
        id,
        patient_id,
        start_time,
        stop_time,
        LEAD(start_time) OVER (
            PARTITION BY patient_id
            ORDER BY start_time
        ) AS next_encounter_start
    FROM hospital.encounters
    WHERE LOWER(encounter_class) = 'inpatient'
      AND start_time IS NOT NULL
)
SELECT
    COUNT(*) AS inpatient_encounters,
    COUNT(*) FILTER (
        WHERE next_encounter_start > COALESCE(stop_time, start_time)
          AND next_encounter_start <=
              COALESCE(stop_time, start_time) + INTERVAL '30 days'
    ) AS potential_30_day_readmissions,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE next_encounter_start > COALESCE(stop_time, start_time)
              AND next_encounter_start <=
                  COALESCE(stop_time, start_time) + INTERVAL '30 days'
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS potential_readmission_percentage
FROM inpatient_encounters;
