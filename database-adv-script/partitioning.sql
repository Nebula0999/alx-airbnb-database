CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Create partitions (example: quarterly partitions for 2025)

CREATE TABLE bookings_2025_q1 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

CREATE TABLE bookings_2025_q2 PARTITION OF bookings
    FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');

CREATE TABLE bookings_2025_q3 PARTITION OF bookings
    FOR VALUES FROM ('2025-07-01') TO ('2025-10-01');

CREATE TABLE bookings_2025_q4 PARTITION OF bookings
    FOR VALUES FROM ('2025-10-01') TO ('2026-01-01');

-- Optional index for each partition
CREATE INDEX idx_bookings_q1_user_id ON bookings_2025_q1(user_id);
CREATE INDEX idx_bookings_q2_user_id ON bookings_2025_q2(user_id);
CREATE INDEX idx_bookings_q3_user_id ON bookings_2025_q3(user_id);
CREATE INDEX idx_bookings_q4_user_id ON bookings_2025_q4(user_id);