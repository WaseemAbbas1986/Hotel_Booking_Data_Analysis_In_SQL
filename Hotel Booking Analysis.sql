create database hotel
use hotel

select * from Hotel

--Total bookings per year/month: Identify booking trends over time.
SELECT year, month, COUNT(ID) AS total_bookings
FROM Hotel
GROUP BY year, month
ORDER BY year, month;

--Weekday vs Weekend booking
SELECT SUM(weekend_nights) AS weekend_stays, SUM(week_nights) AS week_stays
FROM Hotel;

--Analyze which market segments bring the most bookings.
SELECT market_segment, COUNT(ID) AS total_bookings
FROM Hotel
GROUP BY market_segment
ORDER BY total_bookings DESC;

--Understand which meal plans are most popular.
SELECT meal_plan, COUNT(ID) AS total_bookings
FROM Hotel
GROUP BY meal_plan
ORDER BY total_bookings DESC;

--Analyze how many bookings are from repeated guests
SELECT repeated_guest, COUNT(ID) AS total_bookings
FROM Hotel
GROUP BY repeated_guest;

--See if special requests affect the likelihood of cancellation.
SELECT special_requests, COUNT(ID) AS total_bookings, SUM(CASE WHEN status = 'Canceled' THEN 1 ELSE 0 END) AS canceled_bookings
FROM Hotel
GROUP BY special_requests;

--Get the average room price by room type.
SELECT room_type, AVG(avg_room_price) AS avg_price
FROM Hotel
GROUP BY room_type;

--Track changes in average room prices over time.
SELECT year, month, AVG(avg_room_price) AS avg_price
FROM Hotel
GROUP BY year, month
ORDER BY year, month;

--Analyze the percentage of canceled bookings.
SELECT COUNT(ID) AS total_bookings,
SUM(CASE WHEN status = 'Canceled' THEN 1 ELSE 0 END)
AS canceled_bookings
FROM Hotel;

--Check if bookings with shorter lead times are more likely to be canceled.
SELECT lead_time, COUNT(ID) AS total_bookings,
SUM(CASE WHEN status = 'Canceled' THEN 1 ELSE 0 END)
AS canceled_bookings
FROM Hotel
GROUP BY lead_time
ORDER BY lead_time;

--Analyze how many bookings require parking spaces
SELECT car_parking_space, COUNT(ID) AS total_bookings
FROM Hotel
GROUP BY car_parking_space;

--Analyze how far in advance customers are booking
SELECT year, month, AVG(lead_time) AS avg_lead_time
FROM Hotel
GROUP BY year, month
ORDER BY year, month;
