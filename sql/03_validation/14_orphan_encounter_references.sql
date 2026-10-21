
SELECT
    COUNT(*) FILTER (
        WHERE o.id IS NULL AND e.organization_id IS NOT NULL
    ) AS invalid_organization_refs,
    COUNT(*) FILTER (
        WHERE p.id IS NULL AND e.provider_id IS NOT NULL
    ) AS invalid_provider_refs,
    COUNT(*) FILTER (
        WHERE py.id IS NULL AND e.payer_id IS NOT NULL
    ) AS invalid_payer_refs
FROM hospital.encounters e
LEFT JOIN hospital.organizations o
    ON e.organization_id = o.id
LEFT JOIN hospital.providers p
    ON e.provider_id = p.id
LEFT JOIN hospital.payers py
    ON e.payer_id = py.id;
