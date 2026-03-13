--Checking today's cars washed
SELECT * FROM "car"
WHERE DATE("date_washed") = DATE('now');

--Checking today's earnings
SELECT SUM("price") AS "todays_earnings" FROM car
WHERE DATE("date_washed") = DATE('now');

--Checking daily revenue using `daily_revenue` view
SELECT *
FROM "daily_revenue"
WHERE "wash_date" = DATE('now');


--Checking who has washed most vehicles today
SELECT
    "staff"."first_name",
    "staff"."last_name",
    COUNT("car"."id") AS "cars_washed"
FROM "car"
JOIN "staff" ON "car"."washed_by_id" = "staff"."id"
WHERE DATE("car"."date_washed") = DATE('now')
GROUP BY "staff"."id"
ORDER BY "cars_washed" DESC
LIMIT 1;

-- Counting total number of cars washed today
SELECT COUNT(*) AS "total_cars_washed_today"
FROM "car"
WHERE DATE("date_washed") = DATE('now');

-- Correcting the price of a car wash record
UPDATE "car" SET "price" = 10000
WHERE "number_plate" = ?;

-- Inserting a new car wash record with an example
INSERT INTO "car" (
    "number_plate",
    "car_type",
    "washed_by_id",
    "price"
) VALUES (
    'UBD 456M',
    'Sedan',
    2,
    8000
);





--Sample data used to show how the database works

-- Inserting 10 staff members in one statement
INSERT INTO "staff" ("first_name", "last_name", "role")
VALUES
    ('Jesse',  'Mukasa',     'manager'),
    ('James',  'Kato',       'security'),
    ('Nabboth','Ssembatya',  'car_wash assistant'),
    ('Kelly',  'Kyagambiddwa','car_wash assistant'),
    ('Isaiah', 'Okello',     'car_wash assistant'),
    ('Nabboth','Lubega',     'car_wash assistant'),
    ('Kelly',  'Nsubuga',    'car_wash assistant'),
    ('Isaiah', 'Ochieng',    'car_wash assistant'),
    ('Nabboth','Wanyama',    'car_wash assistant'),
    ('Kelly',  'Sserunjogi', 'car_wash assistant');

-- Inserting 30 car wash records
INSERT INTO "car" (
    "number_plate",
    "car_type",
    "washed_by_id",
    "price"
)
VALUES
    ('UBA 123A', 'Sedan', 3, 8000),
    ('UBB 456B', 'Sedan', 4, 8000),
    ('UBC 789C', 'Truck', 5, 15000),
    ('UBD 234D', 'Motorcycle', 6, 3000),
    ('UBE 567E', 'Sedan', 7, 8000),
    ('UBF 890F', 'Truck', 8, 15000),
    ('UBG 345G', 'Motorcycle', 9, 3000),
    ('UBH 678H', 'Sedan', 10, 8000),
    ('UBJ 901J', 'Sedan', 3, 8000),
    ('UBK 234K', 'Truck', 4, 15000),

    ('UBL 567L', 'Motorcycle', 5, 3000),
    ('UBM 890M', 'Sedan', 6, 8000),
    ('UBN 123N', 'Sedan', 7, 8000),
    ('UBP 456P', 'Truck', 8, 15000),
    ('UBQ 789Q', 'Motorcycle', 9, 3000),
    ('UBR 234R', 'Sedan', 10, 8000),
    ('UBS 567S', 'Sedan', 3, 8000),
    ('UBT 890T', 'Truck', 4, 15000),
    ('UBU 345U', 'Motorcycle', 5, 3000),
    ('UBV 678V', 'Sedan', 6, 8000),

    ('UBW 901W', 'Sedan', 7, 8000),
    ('UBX 234X', 'Truck', 8, 15000),
    ('UBY 567Y', 'Motorcycle', 9, 3000),
    ('UBZ 890Z', 'Sedan', 10, 8000),
    ('UCA 123A', 'Sedan', 3, 8000),
    ('UCB 456B', 'Truck', 4, 15000),
    ('UCC 789C', 'Motorcycle', 5, 3000),
    ('UCD 234D', 'Sedan', 6, 8000),
    ('UCE 567E', 'Sedan', 7, 8000),
    ('UCF 890F', 'Truck', 8, 15000);
