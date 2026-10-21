
CREATE OR REPLACE PROCEDURE hospital.get_patient_encounters(
    IN p_patient_id UUID,
    INOUT p_result REFCURSOR DEFAULT 'patient_encounters'
)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN p_result FOR
        SELECT
            id AS encounter_id,
            start_time,
            stop_time,
            encounter_class,
            description,
            total_claim_cost,
            payer_coverage
        FROM hospital.encounters
        WHERE patient_id = p_patient_id
        ORDER BY start_time DESC;
END;
$$;



