
SELECT
    'patients' AS table_name,
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE id IS NULL) AS null_ids
FROM hospital.patients

UNION ALL

SELECT
    'organizations',
    COUNT(*),
    COUNT(*) FILTER (WHERE id IS NULL)
FROM hospital.organizations

UNION ALL

SELECT
    'providers',
    COUNT(*),
    COUNT(*) FILTER (WHERE id IS NULL)
FROM hospital.providers

UNION ALL

SELECT
    'payers',
    COUNT(*),
    COUNT(*) FILTER (WHERE id IS NULL)
FROM hospital.payers

UNION ALL

SELECT
    'encounters',
    COUNT(*),
    COUNT(*) FILTER (WHERE id IS NULL)
FROM hospital.encounters;
