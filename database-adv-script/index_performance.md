SELECT * FROM bookings
WHERE user_id = 5 AND start_date >= '2025-07-01';

## Before index
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 5 AND start_date >= '2025-07-01';

# output
Seq Scan on bookings  (cost=0.00..1024.00 rows=50 width=88)
  Filter: ((user_id = 5) AND (start_date >= '2025-07-01'::date))
  Rows Removed by Filter: 1950
Execution Time: 8.302 ms

## After index
CREATE INDEX idx_bookings_user_date ON bookings(user_id, start_date);
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 5 AND start_date >= '2025-07-01';

# output
Index Scan using idx_bookings_user_date on bookings  (cost=0.43..18.22 rows=10 width=88)
  Index Cond: ((user_id = 5) AND (start_date >= '2025-07-01'::date))
Execution Time: 0.175 ms

Uses index scan, not sequential scan.
Execution time is significantly faster (from 8ms ➝ 0.1ms).

# performance.sql
EXPLAIN ANALYZE
SELECT ...

It results in:
Sequential scans on all tables.

Large intermediate join results.

Poor query planning time if tables grow (e.g., 10K+ rows).

**Refactored Query:**
Adds indexes (if not yet created).

Reduces columns fetched.

Pre-filters inactive/cancelled data (optional).

Joins only necessary fields.
