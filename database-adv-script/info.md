
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



## SUB QUERY :


---

### Explanation of Subqueries:

1. **Non-Correlated Subquery**:
   - **Query**: Finds properties where the average rating is greater than 4.0.
   - **How it works**: The subquery `(SELECT AVG(r.rating) FROM Review r WHERE r.property_id = p.property_id)` calculates the average rating for each property. The main query checks if this value is greater than 4.0. This subquery is independent and can be executed on its own for any given `property_id`.

2. **Correlated Subquery**:
   - **Query**: Finds users who have made more than 3 bookings.
   - **How it works**: The subquery `(SELECT COUNT(*) FROM Booking b WHERE b.user_id = u.user_id)` counts the number of bookings for each user, and this count is compared to 3 in the `WHERE` clause of the outer query. The subquery is "correlated" because it refers to the outer query's `user_id`, meaning it cannot be executed independently of the outer query.

These subqueries demonstrate how to handle both independent and dependent subqueries, providing a solid foundation for complex data retrieval.


## WINDOW FUNCTIONS : 
---

### Explanation of Queries:

1. **Aggregation with `COUNT`**:
   - **Query**: The first query calculates the total number of bookings made by each user. The `COUNT` function counts the `booking_id` values for each user, grouped by `user_id`.
   - **How it works**: The `LEFT JOIN` ensures that users who have not made any bookings are still included, with a count of `0` bookings. The `GROUP BY` clause groups the result by each user's `user_id`, and the results are ordered by the total bookings in descending order.

2. **Window Function with `RANK`**:
   - **Query**: The second query ranks properties based on the total number of bookings they have received. The `RANK()` function is used to assign a rank to each property, with ties in the ranking based on the number of bookings.
   - **How it works**: The `LEFT JOIN` between the `Property` and `Booking` tables ensures that all properties are included, even those without bookings (they will have a `0` count). The `RANK()` function ranks the properties by the number of bookings in descending order, and the `GROUP BY` clause ensures the count is calculated for each property.

These queries help in analyzing the Airbnb database by providing insights into user activity and property popularity based on booking data.
