SELECT 
    bookings.id AS booking_id,
    users.id AS user_id,
    users.full_name,
    users.email,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    bookings.status
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;

SELECT 
    properties.id AS property_id,
    properties.title,
    properties.location,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.id = reviews.property_id;

SELECT 
    users.id AS user_id,
    users.full_name,
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.property_id
FROM 
    users
FULL OUTER JOIN 
    bookings ON users.id = bookings.user_id;


// another example of full outer join query

SELECT 
    users.id AS user_id,
    users.full_name,
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.property_id
FROM 
    users
LEFT JOIN 
    bookings ON users.id = bookings.user_id

UNION

SELECT 
    users.id AS user_id,
    users.full_name,
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.property_id
FROM 
    bookings
LEFT JOIN 
    users ON bookings.user_id = users.id
WHERE users.id IS NULL;
