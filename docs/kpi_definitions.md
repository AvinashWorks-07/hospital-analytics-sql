
# Hospital Analytics — KPI Definitions

## 1. Total Patients

- Definition: Total unique patients.
- Formula: COUNT(DISTINCT patient_id)
- Table: hospital.patients

## 2. Total Encounters

- Definition: Total hospital encounters.
- Formula: COUNT(*)
- Table: hospital.encounters

## 3. Average Length of Stay

- Definition: Average duration of inpatient encounters.
- Formula: Average of stop_time - start_time.
- Table: hospital.encounters
- Note: Calculate only for inpatient encounters with valid timestamps.

## 4. Encounter Class Mix

- Definition: Distribution of encounters by class.
- Formula: Class encounters / Total encounters * 100.
- Table: hospital.encounters

## 5. Condition Prevalence

- Definition: Percentage of patients associated with a condition.
- Formula: Distinct patients with condition / Total patients * 100.
- Table: hospital.conditions

## 6. Average Encounter Cost

- Definition: Average total claim cost per encounter.
- Formula: AVG(total_claim_cost).
- Table: hospital.encounters

## 7. Payer Coverage Share

- Definition: Total payer coverage relative to total claim cost.
- Formula: SUM(payer_coverage) / SUM(total_claim_cost) * 100.
- Table: hospital.encounters
- Note: Handle zero or NULL claim totals.

## 8. Monthly Encounter Growth

- Definition: Percentage change in encounter count compared with the previous month.
- Formula: (Current month - Previous month) / Previous month * 100.
- Table: hospital.encounters

## 9. 30-Day Readmission Rate

- Definition: Percentage of inpatient encounters followed by another inpatient encounter for the same patient within 30 days.
- Note: This is an analytical definition, not a clinical conclusion.

## Dataset Limitation

This project uses synthetic healthcare data. Findings must not be interpreted as real-world clinical evidence.
