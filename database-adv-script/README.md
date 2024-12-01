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
