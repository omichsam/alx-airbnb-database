# Seed Script for AirBnB-like Application Database

This document provides instructions on how to populate the database with sample data using the `seed.sql` script.

## Overview

The `seed.sql` file contains `INSERT` statements to add sample data to the following tables in the database:
- **User**: Sample users (guests, hosts, and an admin).
- **Property**: Sample properties listed by hosts.
- **Booking**: Sample bookings made by users for properties.
- **Payment**: Sample payments made for bookings.
- **Review**: Sample reviews left by users for properties.
- **Message**: Sample messages exchanged between users.

## Steps to Seed the Database

1. **Clone the repository** to your local machine.
2. Navigate to the `database-script-0x02` directory where the `seed.sql` file is located.
3. Run the `seed.sql` file on your PostgreSQL or MySQL database server to populate the database with sample data.

### Running the Script in PostgreSQL

```bash
##### Postgres db
psql -U username -d database_name -f seed.sql
##### Mysql Database  
mysql -u username -p database_name < seed.sql
