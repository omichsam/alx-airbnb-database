-- Creating index on the user_id column in the Booking table for faster lookups during joins
CREATE INDEX idx_user_id ON Booking(user_id);

-- Creating index on the property_id column in the Booking table for faster lookups during joins
CREATE INDEX idx_property_id ON Booking(property_id);

-- Creating index on the start_date column in the Booking table for faster date range queries
CREATE INDEX idx_start_date ON Booking(start_date);

-- Creating index on the end_date column in the Booking table for faster date range queries
CREATE INDEX idx_end_date ON Booking(end_date);

-- Creating index on the user_id column in the User table for faster lookups during joins and queries
CREATE INDEX idx_user_id_user ON User(user_id);

-- Creating index on the email column in the User table for faster searching of users by email
CREATE INDEX idx_email ON User(email);

-- Creating index on the rating column in the Property table for faster filtering by ratings
CREATE INDEX idx_rating ON Property(rating);

-- Creating index on the location column in the Property table for faster location-based filtering
CREATE INDEX idx_location ON Property(location);
