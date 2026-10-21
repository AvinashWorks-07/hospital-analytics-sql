
SELECT
    COUNT(*) AS total_observations,
    COUNT(*) FILTER (
        WHERE NULLIF(TRIM(value), '') IS NULL
    ) AS missing_values,
    COUNT(*) FILTER (
        WHERE NULLIF(TRIM(code), '') IS NULL
    ) AS missing_codes,
    COUNT(*) FILTER (
        WHERE NULLIF(TRIM(description), '') IS NULL
    ) AS missing_descriptions
FROM hospital.observations;
