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