
SELECT
    o.id AS organization_id,
    o.name AS organization_name,
    COUNT(e.id) AS total_encounters,
    ROUND(SUM(e.total_claim_cost), 2) AS total_claim_cost,
    ROUND(AVG(e.total_claim_cost), 2) AS avg_claim_cost
FROM hospital.organizations o
LEFT JOIN hospital.encounters e
    ON e.organization_id = o.id
GROUP BY o.id, o.name
ORDER BY total_encounters DESC
LIMIT 20;
