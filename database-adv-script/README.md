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
