SELECT
    id,
    COUNT(*) AS duplicate_count
FROM hospital.patients
GROUP BY id
HAVING COUNT(*) > 1;