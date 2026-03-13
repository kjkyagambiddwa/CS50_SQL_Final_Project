# Staff Car Wash Management System

A robust SQLite-based relational database designed to streamline operations, track personnel performance, and manage financial transactions for a modern vehicle cleaning facility.

##  Overview
This project transforms manual record-keeping into a structured digital asset. By capturing the intersection of Staff, Services, and Revenue, the system provides stakeholders with actionable insights into daily operations and employee productivity.

##  Technical Architecture
The system is built on a relational schema designed for data integrity and query efficiency.

###  Entity-Relationship Summary
- **Staff Entity:** Tracks personnel and defined roles (Manager, Security, Assistant).
- **Car Entity:** Records granular transaction data, including vehicle types (Sedan, Truck, Motorcycle) and timestamps.
- **Relational Logic:** A One-to-Many relationship ensures every service is tied to a specific staff member for accountability.

###  Performance Optimizations
- **Composite Indexing:** The `car_staff_date` index is implemented on (`washed_by_id`, `date_washed`) to ensure high-speed retrieval of performance metrics.
- **Automated Views:** A `daily_revenue` view provides an abstracted layer for instant financial reporting without writing complex aggregations repeatedly.
- **Data Integrity:** Strict `CHECK` constraints prevent negative pricing and ensure role-based data entry remains consistent.

##  Key Insights & Queries
The system is equipped to answer critical business questions through optimized SQL:

- **Financial Tracking:** Calculate total earnings filtered by specific dates.
- **Operational Volume:** Monitor the throughput of different vehicle types.
- **Performance Analytics:** Identify the "Top Performer" of the day based on volume and revenue generated.

##  Database Schema
```sql
-- Example of the core Car transaction table
CREATE TABLE "car" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "number_plate" TEXT NOT NULL,
    "car_type" TEXT CHECK("car_type" IN ('Truck', 'Sedan', 'Motorcycle', 'other')),
    "washed_by_id" INTEGER NOT NULL,
    "date_washed" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "price" INTEGER NOT NULL CHECK("price" > 0),
    FOREIGN KEY ("washed_by_id") REFERENCES "staff"("id")
);
```

##  Limitations & Future Scope
While the current version excels at individual accountability, the design documents the following areas for future expansion:

- **Multi-Staff Allocation:** Enhancing the schema to support team-based washes.
- **Service Diversification:** Expanding the price logic to include detailed service menus (e.g., detailing, waxing).
- **Role-Based Access:** Implementing application-layer logic to further restrict data entry by staff role.

##  Project Structure
- `schema.sql` – The structural blueprint of the database.
- `queries.sql` – Pre-written analytics and operational scripts.
- `project.db` – The live SQLite database instance.
- `DESIGN.md` – Technical documentation detailing the "why" behind the architecture.
*Developed by Kyagambiddwa J Kelly*  
*Showcasing proficiency in Database Design, SQL Optimization, and Technical Documentation.*
```
