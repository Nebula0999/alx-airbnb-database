// aggregation with COUNT and GROUP BY
SELECT 
    users.id AS user_id,
    users.full_name,
    COUNT(bookings.id) AS total_bookings
FROM 
    users
LEFT JOIN 
    bookings ON users.id = bookings.user_id
GROUP BY 
    users.id, users.full_name
ORDER BY 
    total_bookings DESC;

// aggregation with window function RANK
-- This query ranks properties based on the number of bookings they have received.
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM 
    bookings
GROUP BY 
    property_id;

// to get unique ROW_NUMBER for ties

ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS booking_position


