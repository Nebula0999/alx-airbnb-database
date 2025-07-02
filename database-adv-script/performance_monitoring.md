## Database Performance Optimization

This document outlines the performance enhancements implemented in the database. These optimizations were essential to improve query efficiency, reduce response times, and scale as the dataset grows.

---

## Key Optimization Actions

### 1. Query Profiling with EXPLAIN ANALYZE

We identified slow-performing queries using the PostgreSQL `EXPLAIN ANALYZE` command. Two critical queries were selected for optimization:

- **Query A**: Count total bookings per user  
- **Query B**: Filter properties by location and price range

### 2. Bottleneck Analysis

From the query plans, the following issues were identified:

- Sequential scans on large tables
- No indexes on frequently filtered or grouped columns
- Date-based queries on the `bookings` table were inefficient

---

## Optimizations Applied

### A. Indexing

I created indexes on high-usage columns to speed up JOINs, WHERE conditions, and GROUP BY operations:

```sql
-- Bookings
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_status ON bookings(status);

-- Properties
CREATE INDEX idx_properties_location_price ON properties(location, price);

-- Payments
CREATE INDEX idx_payments_booking_id ON payments(booking_id);