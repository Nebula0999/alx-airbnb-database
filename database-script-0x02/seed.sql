INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  ('111', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest', CURRENT_TIMESTAMP),
  ('222', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pw_2', '2345678901', 'host', CURRENT_TIMESTAMP),
  ('333', 'Carol', 'Williams', 'carol@example.com', 'hashed_pw_3', '3456789012', 'admin', CURRENT_TIMESTAMP);

-- Sample Data for Property
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
  ('aaa', '222', 'Seaside Cottage', 'A lovely beachside stay', 'Mombasa', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('aaa', '222', 'Mountain Cabin', 'Cozy cabin in the hills', 'Mount Kenya', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Sample Data for Booking
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  ('b111', 'aaa', '111', '2025-07-01', '2025-07-05', 480.00, 'confirmed', CURRENT_TIMESTAMP),
  ('b222', 'aaa', '111', '2025-08-10', '2025-08-12', 300.00, 'pending', CURRENT_TIMESTAMP);

-- Sample Data for Review
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  ('r111', 'aaa', '111', 5, 'Amazing place!', CURRENT_TIMESTAMP),
  ('r222', 'aaa', '111', 4, 'Very relaxing and peaceful.', CURRENT_TIMESTAMP);

-- Sample Data for Message
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  ('m111', '1111', '222', 'Is the cottage available in July?', CURRENT_TIMESTAMP),
  ('m222', '222', '111', 'Yes, it is available.', CURRENT_TIMESTAMP);

-- Sample Data for Payment
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  ('p111', 'b111', 480.00, CURRENT_TIMESTAMP, 'credit_card'),
  ('p222', 'b222', 300.00, CURRENT_TIMESTAMP, 'paypal');