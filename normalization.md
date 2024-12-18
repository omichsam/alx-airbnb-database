# Normalization Process for AirBnB Database

This document outlines the normalization process applied to the AirBnB-like database schema. The goal is to ensure the schema is in **Third Normal Form (3NF)**, addressing any potential redundancies or violations of normalization principles.

## Overview of Normal Forms

1. **First Normal Form (1NF)**:
   - Eliminate duplicate rows.
   - Ensure each column contains atomic values (no arrays or lists).
   - Ensure that each record is unique.

2. **Second Normal Form (2NF)**:
   - Achieve 1NF.
   - Remove partial dependencies (no non-prime attribute should depend on part of a composite primary key).

3. **Third Normal Form (3NF)**:
   - Achieve 2NF.
   - Remove transitive dependencies (non-prime attributes should not depend on other non-prime attributes).

---

## Normalization Steps

### Step 1: **Ensure 1NF (First Normal Form)**

In the given schema:
- All entities have atomic values in each column (e.g., `first_name`, `last_name` in `User`, `description` in `Property`).
- There are no multi-valued attributes or repeating groups.

Thus, the schema already satisfies **1NF**.

### Step 2: **Achieve 2NF (Second Normal Form)**

To achieve **2NF**, we need to ensure that:
- The schema is in **1NF** (which it is).
- There are no partial dependencies, meaning non-prime attributes should depend on the whole primary key.

Let’s evaluate each table for 2NF:

- **User Table**:
  - The primary key is `user_id`. All non-prime attributes (`first_name`, `last_name`, `email`, etc.) depend solely on `user_id`. There are no partial dependencies here.

- **Property Table**:
  - The primary key is `property_id`. The non-prime attributes (`name`, `description`, `location`, etc.) depend on `property_id` alone. 
  - `host_id` is a foreign key referencing `User(user_id)` and doesn’t violate 2NF as it directly links to `user_id`.

- **Booking Table**:
  - The primary key is `booking_id`. All non-prime attributes (`start_date`, `end_date`, `total_price`, etc.) depend on `booking_id`.
  - `property_id` and `user_id` are foreign keys and do not create partial dependencies.

- **Payment Table**:
  - The primary key is `payment_id`. All non-prime attributes (`amount`, `payment_date`, etc.) depend on `payment_id`.

- **Review Table**:
  - The primary key is `review_id`. The non-prime attributes (`rating`, `comment`, etc.) depend on `review_id` alone.

- **Message Table**:
  - The primary key is `message_id`. The non-prime attributes (`message_body`, `sent_at`, etc.) depend on `message_id`.

No partial dependencies were found in the schema, so the schema satisfies **2NF**.

### Step 3: **Achieve 3NF (Third Normal Form)**

To achieve **3NF**, we need to ensure:
- The schema is in **2NF** (which it is).
- There are no transitive dependencies, meaning non-prime attributes should not depend on other non-prime attributes.

Let's evaluate for **transitive dependencies**:

- **User Table**: 
  - There are no non-prime attributes that depend on other non-prime attributes. All attributes are directly dependent on `user_id`.

- **Property Table**:
  - All non-prime attributes (`name`, `description`, `location`, etc.) depend only on `property_id`. There are no transitive dependencies.

- **Booking Table**:
  - There are no non-prime attributes that depend on other non-prime attributes. All non-prime attributes depend directly on `booking_id`.

- **Payment Table**:
  - The only non-prime attribute is `payment_method`, and it depends directly on `payment_id`, not on any other non-prime attributes.

- **Review Table**:
  - All non-prime attributes (`rating`, `comment`, `created_at`) depend directly on `review_id`. No transitive dependencies exist.

- **Message Table**:
  - All non-prime attributes depend directly on `message_id`.

The schema is free from **transitive dependencies**, so it satisfies **3NF**.

---

## Conclusion

### Final Schema in 3NF

After reviewing and adjusting the database schema, we confirm that it is now in **Third Normal Form (3NF)**. The tables are free from partial and transitive dependencies, ensuring efficient data storage and eliminating unnecessary redundancy.

Here’s a summary of the normalization steps:

1. **1NF**: Ensured atomicity of data and eliminated multi-valued attributes.
2. **2NF**: Removed partial dependencies by ensuring all non-prime attributes depend on the full primary key.
3. **3NF**: Removed transitive dependencies by ensuring that non-prime attributes depend only on the primary key.