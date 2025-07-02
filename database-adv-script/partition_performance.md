# Query before prtitioning
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';
**output**
Seq Scan on bookings  (cost=0.00..1024.00)
Execution Time: ~7.5 ms

# after partitioning
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';

**output**
Bitmap Heap Scan on bookings_2025_q3
Execution Time: ~0.45 ms

- Partitioning significantly improves performance for date-range queries by reducing scan size and improving index locality. This is especially valuable when handling tens or hundreds of thousands of bookings over time.