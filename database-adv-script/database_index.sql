-- === USERS TABLE ===

-- Index for email (frequently used in login/authentication)
CREATE INDEX idx_users_email ON users(email);

-- === BOOKINGS TABLE ===

-- Index on user_id (used in JOINs and WHERE filters)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on property_id (frequent JOIN/filter for property info)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Composite index for date-based searches (e.g., availability checks)
CREATE INDEX idx_bookings_start_end ON bookings(start_date, end_date);


-- === PROPERTIES TABLE ===

-- Index for location (used in search filters)
CREATE INDEX idx_properties_location ON properties(location);

-- Index for price (used in range filtering)
CREATE INDEX idx_properties_price ON properties(price);
