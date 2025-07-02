## INNER JOIN

This retrieves only the bookings that are linked to users. If there's a booking without a user (e.g., due to data issues), it will not be shown.

## LEFT JOIN

All properties are included in the results. If a property has no review, the review_id, rating, and comment will be NULL.

## FULL OUTER JOIN

This will show:

1. Users with bookings,

2. Users without bookings (with booking fields as NULL),

3. Bookings not linked to any user (with user fields as NULL).