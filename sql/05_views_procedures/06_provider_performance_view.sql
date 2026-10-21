
CREATE OR REPLACE VIEW hospital.vw_provider_performance AS
SELECT
    p.id AS provider_id,
    p.name AS provider_name,
    p.speciality,
    p.city,
    p.state,
    COUNT(e.id) AS total_encounters,
    ROUND(AVG(e.total_claim_cost), 2) AS avg_claim_cost,
    ROUND(SUM(e.total_claim_cost), 2) AS total_claim_cost
FROM hospital.providers p
LEFT JOIN hospital.encounters e
    ON e.provider_id = p.id
GROUP BY
    p.id, p.name, p.speciality, p.city, p.state;
