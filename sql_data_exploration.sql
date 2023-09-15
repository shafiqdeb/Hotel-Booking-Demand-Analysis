
-- sql queries for data exploration
-- please use "hotels" table


-- select all data from table
SELECT *
FROM hotels
LIMIT 100;

-- check for any null values in all columns
SELECT 'hotel' as column_name,
	COUNT(hotel) as count_null
FROM hotels
WHERE hotel IS NULL
UNION
SELECT 'is_canceled',
	COUNT(hotel)
FROM hotels 
WHERE is_canceled IS NULL
UNION
SELECT 'lead_time',
	COUNT(hotel)
FROM hotels
WHERE lead_time IS NULL
UNION
SELECT 'arrival_date_year',
	COUNT(hotel)
FROM hotels
WHERE arrival_date_year IS NULL
UNION
SELECT 'arrival_date_month',
	COUNT(hotel)
FROM hotels
WHERE arrival_date_month IS NULL
UNION
SELECT 'arrival_date_week_number',
	COUNT(hotel)
FROM hotels
WHERE arrival_date_week_number IS NULL
UNION
SELECT 'arrival_date_day_of_month',
	COUNT(hotel)
FROM hotels
WHERE arrival_date_day_of_month IS NULL
UNION
SELECT 'stays_in_weekend_nights',
	COUNT(hotel)
FROM hotels
WHERE stays_in_weekend_nights IS NULL
UNION
SELECT 'stays_in_week_nights',
	COUNT(hotel)
FROM hotels
WHERE stays_in_week_nights IS NULL
UNION
SELECT 'adults',
	COUNT(hotel)
FROM hotels
WHERE adults IS NULL
UNION
SELECT 'children',
	COUNT(hotel)
FROM hotels
WHERE children IS NULL
UNION
SELECT 'babies',
	COUNT(hotel)
FROM hotels
WHERE babies IS NULL
UNION
SELECT 'meal',
	COUNT(hotel)
FROM hotels
WHERE meal IS NULL
UNION
SELECT 'country',
	COUNT(hotel)
FROM hotels
WHERE country IS NULL
UNION
SELECT 'market_segment',
	COUNT(hotel)
FROM hotels
WHERE market_segment IS NULL
UNION
SELECT 'distribution_channel',
	COUNT(hotel)
FROM hotels
WHERE distribution_channel IS NULL
UNION
SELECT 'is_repeated_guest',
	COUNT(hotel)
FROM hotels
WHERE is_repeated_guest IS NULL
UNION
SELECT 'previous_cancellations',
	COUNT(hotel)
FROM hotels
WHERE previous_cancellations IS NULL
UNION
SELECT 'previous_bookings_not_canceled',
	COUNT(hotel)
FROM hotels
WHERE previous_bookings_not_canceled IS NULL
UNION
SELECT 'reserved_room_type',
	COUNT(hotel)
FROM hotels
WHERE reserved_room_type IS NULL
UNION
SELECT 'assigned_room_type',
	COUNT(hotel)
FROM hotels 
WHERE assigned_room_type IS NULL
UNION
SELECT 'booking_changes',
	COUNT(hotel)
FROM hotels
WHERE booking_changes IS NULL
UNION
SELECT 'deposit_type',
	COUNT(hotel)
FROM hotels
WHERE deposit_type IS NULL
UNION
SELECT 'agent',
	COUNT(hotel)
FROM hotels
WHERE agent IS NULL
UNION
SELECT 'company',
	COUNT(hotel)
FROM hotels
WHERE company IS NULL
UNION
SELECT 'days_in_waiting_list',
	COUNT(hotel)
FROM hotels
WHERE days_in_waiting_list IS NULL
UNION
SELECT 'customer_type',
	COUNT(hotel)
FROM hotels
WHERE customer_type IS NULL
UNION
SELECT 'adr',
	COUNT(hotel)
FROM hotels
WHERE adr IS NULL
UNION
SELECT 'required_car_parking_spaces',
	COUNT(hotel)
FROM hotels
WHERE required_car_parking_spaces IS NULL
UNION
SELECT 'total_of_special_requests',
	COUNT(hotel)
FROM hotels
WHERE total_of_special_requests IS NULL
UNION
SELECT 'reservation_status',
	COUNT(hotel)
FROM hotels
WHERE reservation_status IS NULL
UNION
SELECT 'reservation_status_date',
	COUNT(hotel)
FROM hotels
WHERE reservation_status_date IS NULL
ORDER BY count_null DESC;


-- check percentage for null values
-- company, agent, country, children
SELECT 'company' AS column_name,
	ROUND(COUNT(hotel) * 100.0
	/ (SELECT COUNT(hotel) FROM hotels),3) as null_percentage
FROM hotels
WHERE company IS NULL
UNION
SELECT 'agent',
	ROUND(COUNT(hotel) * 100.0
	/ (SELECT COUNT(hotel) FROM hotels),3)
FROM hotels
WHERE agent IS NULL
UNION
SELECT 'country',
	ROUND(COUNT(hotel) * 100.0
	/ (SELECT COUNT(hotel) FROM hotels),3)
FROM hotels
WHERE country IS NULL
UNION
SELECT 'children',
	ROUND(COUNT(hotel) * 100.0
	/ (SELECT COUNT(hotel) FROM hotels),3)
FROM hotels
WHERE children IS NULL
ORDER BY null_percentage DESC;