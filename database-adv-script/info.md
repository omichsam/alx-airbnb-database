
---

### Explanation:

1. **INNER JOIN**:
   - Retrieves all the bookings with the users who made them. Only bookings with an associated user are returned.
   - This join ensures that both the `Booking` and `User` tables must have matching `user_id` values.

2. **LEFT JOIN**:
   - Retrieves all properties and their associated reviews. If a property does not have a review, it will still be returned, with `NULL` values for the review fields.
   - The `LEFT JOIN` ensures that all records from the `Property` table are included, and if no match exists in the `Review` table, `NULL` is returned.

3. **FULL OUTER JOIN**:
   - Retrieves all users and all bookings, even if a user has no bookings or a booking has no associated user. This ensures that the full dataset from both tables is included.
   - The `FULL OUTER JOIN` ensures that all rows from both the `User` and `Booking` tables are included, with `NULL` values where there is no match.

These queries allow for a comprehensive view of the data, covering all possible relationships and ensuring that no relevant information is omitted.