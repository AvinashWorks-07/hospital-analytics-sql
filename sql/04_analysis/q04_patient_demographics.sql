
SELECT
    gender,
    COUNT(*) AS total_patients,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM hospital.patients
GROUP BY gender
ORDER BY total_patients DESC;

SELECT
    state,
    COUNT(*) AS total_patients
FROM hospital.patients
GROUP BY state
ORDER BY total_patients DESC
LIMIT 10;

SELECT
    CASE
        WHEN birthdate IS NULL THEN 'Unknown'
        WHEN birthdate > CURRENT_DATE THEN 'Invalid'
        ELSE
            CASE
                WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, birthdate)) < 18
                    THEN 'Under 18'
                WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, birthdate)) < 36
                    THEN '18-35'
                WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, birthdate)) < 56
                    THEN '36-55'
                ELSE '56+'
            END
    END AS age_group,
    COUNT(*) AS total_patients
FROM hospital.patients
GROUP BY age_group
ORDER BY age_group;
