-- Partitioning the Booking table based on the start_date column

-- Step 1: Create a partitioned Booking table
CREATE TABLE Booking_partitioned (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions for different date ranges (for example, by year)
CREATE TABLE Booking_2020 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2020-01-01') TO ('2021-01-01');

CREATE TABLE Booking_2021 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2021-01-01') TO ('2022-01-01');

CREATE TABLE Booking_2022 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE Booking_2023 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

-- Step 3: Insert data into the partitioned table
-- (Assuming that we already have data in the original Booking table)
INSERT INTO Booking_partitioned (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at, updated_at)
SELECT booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at, updated_at
FROM Booking;

-- Step 4: Drop the old Booking table to save space and prevent duplication
DROP TABLE Booking;

-- Step 5: Rename the partitioned table to match the original table name
ALTER TABLE Booking_partitioned RENAME TO Booking;
