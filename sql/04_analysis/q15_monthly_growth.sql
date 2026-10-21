
WITH monthly AS (
    SELECT
        DATE_TRUNC('month', start_time)::DATE AS encounter_month,
        COUNT(*) AS total_encounters
    FROM hospital.encounters
    WHERE start_time IS NOT NULL
    GROUP BY DATE_TRUNC('month', start_time)::DATE
),
with_previous AS (
    SELECT
        encounter_month,
        total_encounters,
        LAG(total_encounters) OVER (
            ORDER BY encounter_month
        ) AS previous_month_encounters
    FROM monthly
)
SELECT
    encounter_month,
    total_encounters,
    previous_month_encounters,
    ROUND(
        100.0 * (total_encounters - previous_month_encounters)
        / NULLIF(previous_month_encounters, 0),
        2
    ) AS month_over_month_growth_pct
FROM with_previous
ORDER BY encounter_month;
