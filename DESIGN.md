# Design Document

By Kyagambiddwa J Kelly

Video overview: <[https://youtu.be/MsUfQXo-pmg](Illustrating_video)>

## Scope

In this section you should answer the following questions:

### Purpose of the database
The database is for a washing bay. It is meant to input entries of cars washed and revenues collected from the washing of cars and motorcycles.

### The scope of the database

The database encompasses;

* Staff, including the manager, car wash attendants and security personnel.
* Car washed, including the number plate, time it was washed, and how much was spent.

### *outside* the scope of the database

The database supports basic analytics such as daily, monthly, and yearly sales through SQL queries, but does not store analytics results directly.

## Functional Requirements

## What a user should be able to do with my database?
The user can use the database to track records of their washing bay. This can include tracking who washed a specific vehicle in case of issues arising with it e.g valuable theft.
They can analyze how the washing bay is performing by knowing when do they get the most customers and how much they spend.

### What's beyond the scope of what a user should be able to do with my database?
A user can link it to an application or website that provides real time data analytics for better decision making.

## Representation

Entities are captured in SQLite tables with the following schema.

### Entities

The database includes the following entities:

#### Entities I chose to represent in my database along with their attributes

##### Staff

The `staff` table includes:

* `id`, which specifies the unique ID for the staff at the washing bay as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `first_name`, which specifies the staff's first name as `TEXT`. The `TEXT` field is appropriate for the name field. It has a `NOT NULL` constraint to ensure that at least one of the names is not empty.
* `last_name`, which specifies the staff's last name. `TEXT` is used for the same reason as `first_name`.
* `role`, which specifies the staff's role e.g manager, security, and car wash attendant. This is a `TEXT` field, that has a `CHECK` type to specify the roles available. It has a `NOT NULL` constraint to ensure that it is not empty.

##### Car

The `car` table includes:

* `id`, which specifies the unique ID for the car washed at the washing bay as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `number_plate`,which specifies the car number plate as `TEXT`. The `TEXT` field is appropriate for such a combination of letters and numbers. It has a `NOT NULL` constraint to ensure that it is not empty.
* `car_type`, specifying the type of car it is as a `TEXT`. The `TEXT` field is appropriate these are words. It has a `CHECK` data type to specify the main types being used for consistency.
* `washed_by_id`, specifying the id of the staff member that washed the car as an Integer. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `staff` table to ensure data integrity.
* `date_washed`, specifying the date when the car was washed as `DATETIME` capturing the `CURRENT_TIMESTAMP`. This is to capture the current date and time at which the car was washed. It has a `NOT NULL` constraint to ensure that it is not empty.
* `price` specifying the amount paid to wash the car as `INTEGER`. An integer was chosen for the currency of Ugandan Shillings doesn't have decimals. This is strictly positive since prices have to be positive. It has a `NOT NULL` constraint to ensure that it is not empty.



### Relationships

The below entity relationship diagram describes the relationships among the entities in the database.

![/workspaces/164285687/project/Staff Car Wash Management-2025-12-28-170134.png](diagram.png)

As detailed by the diagram:

One staff member is capable of washing 0 to many cars. 0, if they have not yet washed any, and many if the have washed more than one car. It is assumed that a car wash assistant will wash a car alone.

## Optimizations

* Which optimizations (e.g., indexes, views) did you create? Why?

A composite index `car_staff_date` was created to quicken the speed of querying by `date_washed` and by `washed_by_id` for faster retreival of this information.

A view `daily_revenue` showing daily revenues earned and the sum of amount earned. This help to keep track of the daily earnings at the end of the day.

## Limitations

* Limitations of my design

One limitation of this database design is that it does not enforce role-based restrictions on which staff members can wash cars. Although staff roles such as manager, security, and car_wash assistant are stored in the staff table, the database allows any staff member to be associated with a car wash record. As a result, it is possible for a manager or security staff member to be recorded as having washed a car, even though this may not reflect real-world operations.

* What my database might not be able to represent very well
This database may not well represent multiple staff members working on a single car. It doesn't detail the different services offered by the washing bay.
