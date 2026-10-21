# Hospital Analytics — PostgreSQL SQL Project

## Project Overview

A healthcare analytics project built using PostgreSQL to analyze synthetic hospital data, patient demographics, encounters, medical conditions, medications, procedures, healthcare costs, and payer coverage.

The project demonstrates relational database design, data validation, SQL analytics, views, stored procedures, indexing, and query performance analysis.

## Business Objectives

- Analyze patient demographics and healthcare utilization.
- Identify encounter trends over time.
- Evaluate encounter costs and payer coverage.
- Analyze frequently recorded conditions, medications, and procedures.
- Compare provider and healthcare organization activity.
- Validate data quality and referential integrity.
- Optimize analytical queries using indexes and `EXPLAIN ANALYZE`.

## Technology Stack

- Database: PostgreSQL 18
- Database client: pgAdmin 4
- SQL: DDL, DML, joins, aggregations, CTEs, window functions, views, stored procedures
- Performance: Indexing, `EXPLAIN ANALYZE`, `ANALYZE`
- Development environment: Visual Studio Code
- Version control: Git and GitHub

## Dataset

The project uses synthetic healthcare data based on CSV files for:

- Patients
- Organizations
- Providers
- Payers
- Encounters
- Conditions
- Medications
- Observations
- Procedures

### Loaded Dataset Counts

| Table | Rows |
| --- | --: |
| Patients | 1,171 |
| Organizations | 1,119 |
| Providers | 5,855 |
| Payers | 10 |
| Encounters | 53,346 |
| Conditions | 8,376 |
| Medications | 42,989 |
| Observations | 299,697 |
| Procedures | 34,981 |

These counts represent the recorded database load and should be revalidated if the dataset is reloaded.

## Project Structure

```text
hospital-analytics-sql/
├── data/
│   └── raw/
├── sql/
│   ├── 01_schema/
│   ├── 02_load/
│   ├── 03_validation/
│   ├── 04_analysis/
│   ├── 05_views_procedures/
│   └── 06_optimization/
├── docs/
├── results/
│   └── screenshots/
├── .gitignore
└── README.md
```

## Key Analysis Areas

1. Overall dataset and encounter summaries
2. Monthly encounter trends
3. Encounter class distribution
4. Patient demographics
5. Condition frequency
6. Medication and procedure analysis
7. Provider and organization performance
8. Payer coverage analysis
9. High-cost encounters
10. Encounter duration
11. Observation analysis
12. Potential 30-day readmissions
13. Data quality validation
14. Query optimization and index usage

## Database Engineering

- Designed normalized relational tables with primary and foreign keys.
- Loaded CSV data through staging tables.
- Created validation queries for missing values, duplicate records, invalid dates, and orphan references.
- Built analytical SQL views for reusable reporting.
- Created indexes for commonly queried encounter and patient columns.
- Used `EXPLAIN ANALYZE` and PostgreSQL index statistics to inspect query execution.

## Performance Testing

A patient-specific encounter lookup returned six rows in one observed execution with an execution time of 0.072 ms. The query plan used the `idx_encounters_patient_id` index.

This is a single observed measurement, not a benchmark guarantee. Performance varies with cache state, system resources, and data volume.

## Limitations

- The dataset is synthetic and does not represent actual patients or clinical outcomes.
- Healthcare cost fields should not be interpreted as profit or net revenue.
- Potential readmission metrics require careful definition and validation.
- No performance improvement percentage should be claimed without comparable before-and-after measurements.

## Future Improvements

- Develop a Power BI dashboard connected to PostgreSQL.
- Add automated data quality checks.
- Create repeatable data loading scripts.
- Add role-based database access and reporting permissions.
- Compare query plans and execution times before and after indexing.

## Author

Avinash Patel

## Disclaimer

This project is intended for educational and portfolio purposes. The synthetic data and resulting analyses must not be used to make clinical decisions.
