
SELECT COUNT(*) AS orphan_providers
FROM hospital.providers p
LEFT JOIN hospital.organizations o
    ON p.organization_id = o.id
WHERE o.id IS NULL;
