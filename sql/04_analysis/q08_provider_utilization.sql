
SELECT
    p.id AS provider_id,
    p.name AS provider_name,
    p.speciality,
    o.name AS organization_name,
    p.utilization
FROM hospital.providers p
LEFT JOIN hospital.organizations o
    ON p.organization_id = o.id
ORDER BY p.utilization DESC NULLS LAST
LIMIT 20;
