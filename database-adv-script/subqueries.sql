// Non-correlated subquery to find properties with an average rating greater than 4.0
SELECT 
    id,
    title,
    location
FROM 
    properties
WHERE 
    id IN (
        SELECT 
            property_id
        FROM 
            reviews
        GROUP BY 
            property_id
        HAVING 
            AVG(rating) > 4.0
    );

// Correlated subquery to find users with more than 3 bookings
SELECT 
    id,
    full_name,
    email
FROM 
    users u
WHERE 
    (
        SELECT COUNT(*)
        FROM bookings b
        WHERE b.user_id = u.id
    ) > 3;
