
CREATE OR REPLACE VIEW hospital.vw_organization_performance AS
SELECT
    o.id AS organization_id,
    o.name AS organization_name,
    o.city,
    o.state,
    COUNT(e.id) AS total_encounters,
    COUNT(DISTINCT e.patient_id) AS unique_patients,
    ROUND(AVG(e.total_claim_cost), 2) AS avg_claim_cost,
    ROUND(SUM(e.total_claim_cost), 2) AS total_claim_cost
FROM hospital.organizations o
LEFT JOIN hospital.encounters e
    ON e.organization_id = o.id
GROUP BY o.id, o.name, o.city, o.state;
