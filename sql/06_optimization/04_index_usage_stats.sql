
SELECT
    schemaname,
    relname AS table_name,
    indexrelname AS index_name,
    idx_scan AS index_scans,
    idx_tup_read AS index_tuples_read,
    idx_tup_fetch AS index_tuples_fetched
FROM pg_stat_user_indexes
WHERE schemaname = 'hospital'
ORDER BY idx_scan DESC, table_name;
