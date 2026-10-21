
CREATE OR REPLACE VIEW hospital.vw_high_cost_encounters AS
SELECT
    e.id AS encounter_id,
    e.patient_id,
    e.start_time,
    e.encounter_class,
    e.description,
    e.total_claim_cost,
    e.payer_coverage
FROM hospital.encounters e
WHERE e.total_claim_cost IS NOT NULL
  AND e.total_claim_cost >= (
      SELECT PERCENTILE_CONT(0.90)
             WITHIN GROUP (ORDER BY total_claim_cost)
      FROM hospital.encounters
      WHERE total_claim_cost IS NOT NULL
  );
