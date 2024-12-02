-- Step 1: Total Number of Bookings Made by Each User using COUNT and GROUP BY

SELECT u.user_id, u.name AS user_name, COUNT(b.booking_id) AS total_bookings
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;

-- Explanation:
-- This query retrieves the total number of bookings made by each user.
-- The `COUNT(b.booking_id)` aggregates the bookings by each user.
-- The `LEFT JOIN` ensures that users with no bookings are also included in the result.
-- The results are ordered by the `total_bookings` in descending order, showing users with the most bookings at the top.

-- Step 2: Ranking Properties Based on the Total Number of Bookings Using Window Functions

-- Using RANK() to rank properties by booking count
SELECT p.property_id, p.property_name, COUNT(b.booking_id) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.property_name
ORDER BY booking_rank;

-- Explanation:
-- This query ranks properties based on the total number of bookings they have received using RANK().
-- The `COUNT(b.booking_id)` calculates the total bookings for each property.
-- The `RANK()` window function assigns a rank to each property based on the number of bookings in descending order.
-- The `LEFT JOIN` ensures that properties with no bookings are included in the result, and their rank will be last.
-- The result is ordered by the booking rank.

-- Using ROW_NUMBER() to rank properties by booking count
SELECT p.property_id, p.property_name, COUNT(b.booking_id) AS total_bookings,
       ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_row_number
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.property_name
ORDER BY booking_row_number;

-- Explanation:
-- This query ranks properties using the `ROW_NUMBER()` window function based on the total number of bookings.
-- The `ROW_NUMBER()` function assigns a unique row number to each property, ordered by the number of bookings in descending order.
-- Properties with more bookings will have a lower row number (1 being the highest rank).
-- The `LEFT JOIN` ensures that properties with no bookings are included, but they will receive a higher row number.
-- The result is ordered by the `booking_row_number`.

-- Notes:
-- 1. The `COUNT` function is used for aggregation in both queries.
-- 2. The `RANK()` window function is used to assign ranks to properties based on the number of bookings.
-- 3. The `ROW_NUMBER()` window function assigns a unique sequential number to properties based on the booking count.
-- 4. The `LEFT JOIN` ensures that properties with no bookings are included in the results.

