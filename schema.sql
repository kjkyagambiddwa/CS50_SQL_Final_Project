--creating a table to input the staff details
CREATE TABLE IF NOT EXISTS "staff"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT,
    "role" TEXT NOT NULL CHECK("role" IN ('manager','security','car_wash assistant'))
);

--creating a table to input car transactions
CREATE TABLE IF NOT EXISTS "car"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "number_plate" TEXT NOT NULL,
    "car_type" TEXT CHECK("car_type" IN ('Truck', 'Sedan', 'Motorcycle', 'other')),
    "washed_by_id" INTEGER NOT NULL,
    "date_washed" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "price" INTEGER NOT NULL CHECK("price" > 0),
    FOREIGN KEY ("washed_by_id") REFERENCES "staff"("id")
);

--an index to optimize searching for staff members who washed cars and the date
CREATE INDEX "car_staff_date"
ON "car"("washed_by_id", "date_washed");

--View to see daily revenues
CREATE VIEW "daily_revenue" AS
SELECT DATE("date_washed") AS "wash_date",
        SUM("price") AS "total_revenue"
FROM "car"
GROUP BY DATE("date_washed");
