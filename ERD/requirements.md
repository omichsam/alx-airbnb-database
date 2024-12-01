# Entity-Relationship Diagram (ERD) for AirBnB-like Database

This document provides an Entity-Relationship (ER) diagram and description of the database schema for an AirBnB-like platform. It details the entities, their attributes, and relationships between them based on the provided database specification.

## Entities and Attributes

### 1. **User**
- **user_id** (Primary Key)
- first_name
- last_name
- email
- password_hash
- phone_number
- role (Enum: guest, host, admin)
- created_at

### 2. **Property**
- **property_id** (Primary Key)
- host_id (Foreign Key referencing `User(user_id)`)
- name
- description
- location
- pricepernight
- created_at
- updated_at

### 3. **Booking**
- **booking_id** (Primary Key)
- property_id (Foreign Key referencing `Property(property_id)`)
- user_id (Foreign Key referencing `User(user_id)`)
- start_date
- end_date
- total_price
- status (Enum: pending, confirmed, canceled)
- created_at

### 4. **Payment**
- **payment_id** (Primary Key)
- booking_id (Foreign Key referencing `Booking(booking_id)`)
- amount
- payment_date
- payment_method (Enum: credit_card, paypal, stripe)

### 5. **Review**
- **review_id** (Primary Key)
- property_id (Foreign Key referencing `Property(property_id)`)
- user_id (Foreign Key referencing `User(user_id)`)
- rating (Integer: 1-5)
- comment
- created_at

### 6. **Message**
- **message_id** (Primary Key)
- sender_id (Foreign Key referencing `User(user_id)`)
- recipient_id (Foreign Key referencing `User(user_id)`)
- message_body
- sent_at

## Relationships Between Entities

### 1. **User and Property**
- A **User** (as a host) can have multiple **Properties**.  
- **Property** has a **host_id** that references **User(user_id)**.

### 2. **User and Booking**
- A **User** (as a guest) can make multiple **Bookings**.  
- **Booking** has a **user_id** that references **User(user_id)**.

### 3. **Property and Booking**
- A **Property** can have multiple **Bookings**.  
- **Booking** has a **property_id** that references **Property(property_id)**.

### 4. **Booking and Payment**
- A **Booking** can have one **Payment**.  
- **Payment** has a **booking_id** that references **Booking(booking_id)**.

### 5. **User and Review**
- A **User** can leave multiple **Reviews** for different **Properties**.  
- **Review** has a **user_id** that references **User(user_id)**.

### 6. **Property and Review**
- A **Property** can have multiple **Reviews**.  
- **Review** has a **property_id** that references **Property(property_id)**.

### 7. **User and Message**
- A **User** can send many **Messages**.  
- **Message** has a **sender_id** that references **User(user_id)**.

### 8. **Recipient and Message**
- A **User** can receive many **Messages**.  
- **Message** has a **recipient_id** that references **User(user_id)**.

## ER Diagram Overview

### Diagram Structure:
- **Entities**: Represented as rectangles.
- **Attributes**: Represented as ovals connected to the entity.
- **Relationships**: Represented as diamonds connecting the entities.
- **Primary Keys**: Indicated by underlining the attribute.
- **Foreign Keys**: Shown as attributes in the related entities.
- **Cardinality**: Indicated near the relationships (1:1, 1:N, N:M).

### Steps for Drawing the ER Diagram

1. **User Entity**: 
   - Draw a rectangle and label it `User`.
   - List attributes: `user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`.
   - Underline `user_id` as the primary key.

2. **Property Entity**:
   - Draw a rectangle for `Property`.
   - List attributes: `property_id`, `host_id`, `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`.
   - Underline `property_id` as the primary key.
   - Draw a diamond labeled `hosts` between `User` and `Property`, indicating the relationship between the host and property.

3. **Booking Entity**:
   - Draw a rectangle for `Booking`.
   - List attributes: `booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`.
   - Underline `booking_id` as the primary key.
   - Draw a diamond labeled `books` between `User` and `Booking`, and another labeled `reserves` between `Property` and `Booking`.

4. **Payment Entity**:
   - Draw a rectangle for `Payment`.
   - List attributes: `payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`.
   - Underline `payment_id` as the primary key.
   - Draw a diamond labeled `made` between `Booking` and `Payment`.

5. **Review Entity**:
   - Draw a rectangle for `Review`.
   - List attributes: `review_id`, `property_id`, `user_id`, `rating`, `comment`, `created_at`.
   - Underline `review_id` as the primary key.
   - Draw a diamond labeled `reviews` between `User` and `Review`, and another labeled `is_reviewed` between `Property` and `Review`.

6. **Message Entity**:
   - Draw a rectangle for `Message`.
   - List attributes: `message_id`, `sender_id`, `recipient_id`, `message_body`, `sent_at`.
   - Underline `message_id` as the primary key.
   - Draw a diamond labeled `sends` between `User` and `Message` (for sender), and another labeled `receives` between `User` and `Message` (for recipient).

## Relationships Diagram Example:

- **User** —< **Booking** >— **Property**  
- **User** —< **Review** >— **Property**  
- **User** —< **Message** >— **User** (Sender/Receiver)
- **Booking** —< **Payment**

## Tools for Diagram Creation

You can use the following tools to create a visual ER diagram:
- [Draw.io](https://app.diagrams.net/) (Free and easy to use for creating ER diagrams)
- [Lucidchart](https://www.lucidchart.com/) (Offers advanced features)
- [Microsoft Visio](https://www.microsoft.com/en-us/microsoft-365/visio/flowchart-software) (For more detailed and professional designs)

If you need help generating the ER diagram, feel free to reach out.
