# Database Schema for AirBnB-like Application

This document provides an overview of the database schema used for the AirBnB-like application. The schema is designed to store information about users, properties, bookings, payments, reviews, and messages.

## Database Structure

The database consists of the following main tables:

1. **User**: Stores information about users, including personal details, email, and role.
2. **Property**: Stores information about properties listed by hosts, including details about the property, host, and pricing.
3. **Booking**: Stores information about bookings made by users for properties.
4. **Payment**: Stores information about payments made for bookings.
5. **Review**: Stores reviews left by users for properties.
6. **Message**: Stores messages exchanged between users.

## SQL Script

The `schema.sql` file contains the SQL DDL statements to create the necessary tables and relationships. It defines the primary keys, foreign keys, and appropriate data types for each attribute.

### Key Points:
- **Primary Keys**: Uniquely identify each record in a table (e.g., `user_id`, `property_id`).
- **Foreign Keys**: Ensure referential integrity between tables (e.g., `host_id` in `Property` references `user_id` in `User`).
- **Constraints**: Enforce data integrity (e.g., `rating` must be between 1 and 5 in `Review`).
- **Indexes**: Optimize queries on frequently searched columns (e.g., `email` in `User`).

## Setup Instructions

1. Clone the repository to your local machine.
2. Navigate to the `database-script-0x01` directory.
3. Run the `schema.sql` file on your PostgreSQL or MySQL database server.

```bash
psql -U username -d database_name -f schema.sql
