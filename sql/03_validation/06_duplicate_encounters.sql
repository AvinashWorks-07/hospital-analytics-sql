SELECT
    id,
    COUNT(*) AS duplicate_count
FROM hospital.encounters
GROUP BY id
HAVING COUNT(*) > 1;