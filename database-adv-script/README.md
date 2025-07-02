## INNER JOIN

This retrieves only the bookings that are linked to users. If there's a booking without a user (e.g., due to data issues), it will not be shown.

## LEFT JOIN

All properties are included in the results. If a property has no review, the review_id, rating, and comment will be NULL.

## FULL OUTER JOIN

This will show:

1. Users with bookings,

2. Users without bookings (with booking fields as NULL),

3. Bookings not linked to any user (with user fields as NULL).

## SUB QUERY

**Non-correlated subquery**

The subquery calculates the AVG(rating) for each property.

Only property IDs with an average rating greater than 4.0 are returned.

The outer query selects those properties.

**Correlated subquery**

For each user in the outer query, the subquery counts bookings where user_id matches.

If the count is greater than 3, the user is included in the result.

This is a correlated subquery because the inner query depends on a value (u.id) from the outer query.