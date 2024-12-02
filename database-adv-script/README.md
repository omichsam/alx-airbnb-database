# SQL Joins Queries for Airbnb Database

This file contains SQL queries demonstrating different types of joins to retrieve relevant information from the Airbnb database.

## Overview

The following queries are provided:
1. **INNER JOIN**: Retrieve all bookings and the respective users who made those bookings.
2. **LEFT JOIN**: Retrieve all properties and their reviews, including properties that have no reviews.
3. **FULL OUTER JOIN**: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

## Query 1: INNER JOIN - Bookings and Users
The first query retrieves all bookings and the respective users who made those bookings. It uses an `INNER JOIN` to combine the `Booking` table with the `User` table, ensuring that only bookings with valid user associations are included.

### SQL:

```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    u.email AS user_email
FROM 
    Booking b
INNER JOIN 
    "User" u ON b.user_id = u.user_id;


# Subqueries for Airbnb Database

This file contains SQL queries demonstrating the use of both correlated and non-correlated subqueries in an Airbnb-like database.

## Overview

The following queries are provided:
1. **Non-Correlated Subquery**: Find all properties where the average rating is greater than 4.0.
2. **Correlated Subquery**: Find users who have made more than 3 bookings.

## Query 1: Non-Correlated Subquery - Properties with an Average Rating Greater Than 4.0
This query retrieves all properties where the average rating is greater than 4.0. The subquery is non-correlated because it can be executed independently of the outer query.

### SQL:

```sql
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight
FROM 
    Property p
WHERE 
    (SELECT AVG(r.rating) 
     FROM Review r 
     WHERE r.property_id = p.property_id) > 4.0;



## WINDOW FUNCTIONS :

# Aggregations and Window Functions for Airbnb Database

This file contains SQL queries demonstrating the use of aggregation functions and window functions to analyze data in the Airbnb-like database.

## Overview

The following queries are provided:
1. **Aggregation (COUNT)**: Find the total number of bookings made by each user.
2. **Window Function (ROW_NUMBER and RANK)**: Rank properties based on the total number of bookings they have received.

## Query 1: Aggregation - Total Bookings Made by Each User
This query calculates the total number of bookings made by each user using the `COUNT` function. It groups the data by the user's `user_id` and orders the results by the total number of bookings in descending order.

### SQL:

```sql
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(b.booking_id) AS total_bookings
FROM 
    "User" u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id
GROUP BY 
    u.user_id
ORDER BY 
    total_bookings DESC;


    -- Optimize Complex queries


---

### Summary of Optimizations:
1. **Indexes**: We created indexes on frequently used columns like `user_id`, `property_id`, and `booking_id` to speed up joins.
2. **EXPLAIN Analysis**: Using `EXPLAIN`, we identified full table scans and optimized the query by reducing unnecessary joins and ensuring the database used indexes.
3. **Refactor Query**: The refactored query ensures optimal execution by leveraging indexes and optimizing joins.

This process improves the performance of complex queries and ensures better scalability for large datasets.


