-- Step 1: Initial Complex Query

-- Initial Query: Retrieve all bookings along with user, property, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email AS user_email,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    p.pricepernight AS property_price_per_night,
    py.payment_id,
    py.amount AS payment_amount,
    py.payment_method,
    py.payment_date
FROM 
    Booking b
INNER JOIN 
    "User" u ON b.user_id = u.user_id
INNER JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment py ON b.booking_id = py.booking_id
ORDER BY 
    b.booking_id;

-- Step 2: Analyze Query Performance with EXPLAIN
-- To analyze the performance of the above query, use EXPLAIN to check the query execution plan:

EXPLAIN 
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email AS user_email,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    p.pricepernight AS property_price_per_night,
    py.payment_id,
    py.amount AS payment_amount,
    py.payment_method,
    py.payment_date
FROM 
    Booking b
INNER JOIN 
    "User" u ON b.user_id = u.user_id
INNER JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment py ON b.booking_id = py.booking_id
ORDER BY 
    b.booking_id;


-- Step 3: Identify Inefficiencies
-- Using the EXPLAIN output, we can identify inefficiencies such as:

-- Full table scans: This happens when there are no indexes on frequently used columns in the WHERE, JOIN, or ORDER BY clauses.
-- Unnecessary joins: The use of LEFT JOIN on the Payment table may not be needed if all bookings are guaranteed to have a corresponding payment.
-- Non-optimal ordering: If the ORDER BY clause is applied to a column with no index, the query may require a full scan to sort the data.

-- Step 4: Refactor the Query for Optimization
-- After identifying the inefficiencies, we can refactor the query to improve its performance:

-- Ensure Indexing: Ensure indexes are present on frequently used columns like user_id, property_id, 
-- booking_id, and payment_id to speed up the JOIN operations.
-- Remove Unnecessary Joins: If payments are not always necessary, use a LEFT JOIN only when required.
-- Optimize Sorting: If sorting by booking_id is critical, ensure there's an index on booking_id.

-- Refactored Query: Retrieve all bookings with optimized joins and indexing
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email AS user_email,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    p.pricepernight AS property_price_per_night,
    py.payment_id,
    py.amount AS payment_amount,
    py.payment_method,
    py.payment_date
FROM 
    Booking b
INNER JOIN 
    "User" u ON b.user_id = u.user_id
INNER JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment py ON b.booking_id = py.booking_id
-- Ensure indexes are in place on the following columns: b.user_id, b.property_id, b.booking_id, py.booking_id
ORDER BY 
    b.booking_id;
