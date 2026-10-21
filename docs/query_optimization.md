
# Query Optimization — Hospital Analytics

## Test: Patient-specific encounter lookup

- Index used: `idx_encounters_patient_id`
- Scan type: Bitmap Index Scan + Bitmap Heap Scan
- Sort method: Quicksort
- Rows returned: 6
- Planning time: 0.173 ms
- Execution time: 0.072 ms
- Shared buffers: 1 hit, 2 read

## Conclusion

PostgreSQL used the patient ID index to locate matching encounters.
The query returned 6 records and completed in 0.072 ms in this test run.

## Limitation

This is one execution on the current database. Execution time can vary
with cache state, machine resources, and data volume. A fair index
comparison requires measuring the same query before and after indexing.
