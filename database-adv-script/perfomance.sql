SELECT 
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date,
    bookings.status,

    users.id AS user_id,
    users.full_name,
    users.email,

    properties.id AS property_id,
    properties.title,
    properties.location,

    payments.id AS payment_id,
    payments.amount,
    payments.status AS payment_status,
    payments.payment_date

FROM 
    bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON payments.booking_id = bookings.id;

EXPLAIN ANALYZE
SELECT ...

-- Refactored: reduced fields + performance-conscious joins
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.status,

    u.full_name,
    u.email,

    p.title,
    p.location,

    pay.amount,
    pay.status AS payment_status

FROM 
    bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
WHERE 
    b.status IN ('confirmed', 'completed');  -- Optional filter

-- Required for fast joins and filters
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
CREATE INDEX idx_bookings_status ON bookings(status);


EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.status,

    u.full_name,
    u.email,

    p.title,
    p.location,

    pay.amount,
    pay.status AS payment_status

FROM 
    bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
WHERE 
    b.status IN ('confirmed', 'completed');
-- This query retrieves booking details along with user, property, and payment information.
-- It uses INNER JOINs for mandatory relationships and LEFT JOIN for optional payment details.

-- output:
Nested Loop Left Join  (cost=1.43..82.45 rows=50 width=152) (actual time=0.112..0.398 rows=38 loops=1)
  -> Nested Loop  (cost=0.85..52.67 rows=50 width=128) (actual time=0.082..0.273 rows=38 loops=1)
        -> Nested Loop  (cost=0.42..30.25 rows=50 width=104) (actual time=0.050..0.174 rows=38 loops=1)
              -> Index Scan using idx_bookings_status on bookings b  (cost=0.28..12.54 rows=50 width=88) (actual time=0.030..0.105 rows=38 loops=1)
                    Index Cond: (status = ANY ('{confirmed,completed}'::text[]))
              -> Index Scan using users_pkey on users u  (cost=0.14..0.33 rows=1 width=40) (actual time=0.002..0.002 rows=1 loops=38)
                    Index Cond: (id = b.user_id)
        -> Index Scan using properties_pkey on properties p  (cost=0.43..0.45 rows=1 width=32) (actual time=0.002..0.002 rows=1 loops=38)
              Index Cond: (id = b.property_id)
  -> Index Scan using idx_payments_booking_id on payments pay  (cost=0.58..0.59 rows=1 width=24) (actual time=0.003..0.003 rows=1 loops=38)
        Index Cond: (booking_id = b.id)

Planning Time: 0.342 ms
Execution Time: 0.525 ms
