
-- sql queries for data analysis
-- please use "hotels_cleaned" table

---------------------
-- slide 3
-- Total all bookings
SELECT
	COUNT(hotel) AS total_bookings
FROM
	hotels_cleaned;

-- Total bookings in City and Resort hotels
SELECT
	hotel,
	COUNT(hotel) AS total_bookings
FROM
	hotels_cleaned hc
GROUP BY hotel;

-- Percentage of City and Resort hotel bookings
SELECT
	hotel,
	ROUND(COUNT(hotel) * 100.0 /
		(SELECT COUNT(hotel)
		FROM hotels_cleaned),2) AS percent_of_bookings
FROM
	hotels_cleaned
GROUP BY hotel;


-- Total stayed and cancelled
SELECT 
	is_canceled AS status,
	COUNT(is_canceled) AS total_status
FROM
	hotels_cleaned
GROUP BY
	is_canceled;

---------------------	
-- slide 4
-- Percentage of stayed and cancelled
SELECT 
	is_canceled,
	ROUND(COUNT(hotel) * 100.0 /
		(SELECT COUNT(is_canceled)
		FROM hotels_cleaned),2) AS percent_of_status	
FROM
	hotels_cleaned
GROUP BY
	is_canceled;

-- Percentage of stayed and canceled by hotel type
SELECT
	hotel,
	is_canceled AS status,
	ROUND(COUNT(hotel) * 100.0 /
		(SELECT COUNT(hotel)
			FROM hotels_cleaned
			WHERE hotel = 'City Hotel'
		),2) AS percentage
FROM hotels_cleaned
WHERE hotel = 'City Hotel'
GROUP BY hotel, status
UNION
SELECT
	hotel,
	is_canceled AS status,
	ROUND(COUNT(hotel) * 100.0 /
		(SELECT COUNT(hotel)
			FROM hotels_cleaned
			WHERE hotel = 'Resort Hotel'
		),2) AS percentage
FROM hotels_cleaned
WHERE hotel = 'Resort Hotel'
GROUP BY hotel, status;

---------------------
-- slide 5
-- Top 10 countries with most orders
SELECT country_name, COUNT(hotel) AS total_bookings
FROM hotels_cleaned
GROUP BY country_name
ORDER BY total_bookings DESC
LIMIT 10;

-- Orders based on regions
SELECT region, COUNT(hotel) AS total_bookings
FROM hotels_cleaned
WHERE region NOT NULL
GROUP BY region
ORDER BY total_bookings DESC;

---------------------
-- slide 6
-- Total bookings in Arrival date months (both hotels)
SELECT
	CASE
		WHEN arrival_date_month = 'January' THEN 1
		WHEN arrival_date_month = 'February' THEN 2
		WHEN arrival_date_month = 'March' THEN 3
		WHEN arrival_date_month = 'April' THEN 4
		WHEN arrival_date_month = 'May' THEN 5
		WHEN arrival_date_month = 'June' THEN 6
		WHEN arrival_date_month = 'July' THEN 7
		WHEN arrival_date_month = 'August' THEN 8
		WHEN arrival_date_month = 'September' THEN 9
		WHEN arrival_date_month = 'October' THEN 10
		WHEN arrival_date_month = 'November' THEN 11
		WHEN arrival_date_month = 'December' THEN 12
	END AS months,
	COUNT(hotel) AS total_bookings
FROM hotels_cleaned
GROUP BY arrival_date_month
ORDER BY months;

-- Total bookings in Arrival date months (separated by hotel type)
WITH
	AA AS
	(
		SELECT
		arrival_date_month,
			COUNT(hotel) AS ch_bookings
		FROM hotels_cleaned
		WHERE hotel = 'City Hotel'
		GROUP BY arrival_date_month
	),
	BB AS
	(
		SELECT
			arrival_date_month,
			COUNT(hotel) AS rh_bookings
		FROM hotels_cleaned
		WHERE hotel = 'Resort Hotel'
		GROUP BY arrival_date_month
	)
SELECT
	CASE
		WHEN AA.arrival_date_month = 'January' THEN 1
		WHEN AA.arrival_date_month = 'February' THEN 2
		WHEN AA.arrival_date_month = 'March' THEN 3
		WHEN AA.arrival_date_month = 'April' THEN 4
		WHEN AA.arrival_date_month = 'May' THEN 5
		WHEN AA.arrival_date_month = 'June' THEN 6
		WHEN AA.arrival_date_month = 'July' THEN 7
		WHEN AA.arrival_date_month = 'August' THEN 8
		WHEN AA.arrival_date_month = 'September' THEN 9
		WHEN AA.arrival_date_month = 'October' THEN 10
		WHEN AA.arrival_date_month = 'November' THEN 11
		WHEN AA.arrival_date_month = 'December' THEN 12
	END AS months,
	ch_bookings, rh_bookings
FROM AA
JOIN BB ON AA.arrival_date_month = BB.arrival_date_month
ORDER BY months;

-- Most booked months in each hotel type
SELECT
	hotel_type,
	arrival_date_month,
	MAX(total_bookings) AS bookings
FROM
(
	SELECT
		'City Hotel' AS hotel_type,
		arrival_date_month,
		COUNT(hotel) AS total_bookings
	FROM
		hotels_cleaned
	WHERE hotel = 'City Hotel'
	GROUP BY arrival_date_month
) AS highest_bookings
UNION
SELECT
	hotel_type,
	arrival_date_month,
	MAX(total_bookings)
FROM
(
	SELECT
		'Resort Hotel' AS hotel_type,
		arrival_date_month,
		COUNT(hotel) AS total_bookings
	FROM
		hotels_cleaned
	WHERE hotel = 'Resort Hotel'
	GROUP BY arrival_date_month
) AS highest_bookings;

-- Hotel Room prices in  Arrival date months
WITH
	AA AS
	(
		SELECT
			arrival_date_month,
			ROUND(AVG(adr),0) AS ch_adr
		FROM hotels_cleaned
		WHERE hotel = 'City Hotel'
		GROUP BY arrival_date_month
	),
	BB AS
	(
		SELECT
			arrival_date_month,
			ROUND(AVG(adr),0) AS rh_adr
		FROM hotels_cleaned
		WHERE hotel = 'Resort Hotel'
		GROUP BY arrival_date_month
	)
SELECT
	CASE
		WHEN AA.arrival_date_month = 'January' THEN 1
		WHEN AA.arrival_date_month = 'February' THEN 2
		WHEN AA.arrival_date_month = 'March' THEN 3
		WHEN AA.arrival_date_month = 'April' THEN 4
		WHEN AA.arrival_date_month = 'May' THEN 5
		WHEN AA.arrival_date_month = 'June' THEN 6
		WHEN AA.arrival_date_month = 'July' THEN 7
		WHEN AA.arrival_date_month = 'August' THEN 8
		WHEN AA.arrival_date_month = 'September' THEN 9
		WHEN AA.arrival_date_month = 'October' THEN 10
		WHEN AA.arrival_date_month = 'November' THEN 11
		WHEN AA.arrival_date_month = 'December' THEN 12
	END AS months,
	ch_adr, rh_adr
FROM AA
JOIN BB ON AA.arrival_date_month = BB.arrival_date_month
ORDER BY months;

---------------------
-- slide 7
-- correlation between room rate and booking cancelled by months
WITH
	AA AS
	(
		SELECT
			arrival_date_month,
			ROUND(AVG(adr),2)  AS avg_adr
		FROM hotels_cleaned
		WHERE is_canceled = 'Canceled'
		GROUP BY arrival_date_month
	),
	BB AS
	(
		SELECT
			arrival_date_month,
			COUNT(is_canceled) AS total_canceled
		FROM hotels_cleaned
		WHERE is_canceled = 'Canceled'
		GROUP BY arrival_date_month
	)
SELECT
	CASE
		WHEN AA.arrival_date_month = 'January' THEN 1
		WHEN AA.arrival_date_month = 'February' THEN 2
		WHEN AA.arrival_date_month = 'March' THEN 3
		WHEN AA.arrival_date_month = 'April' THEN 4
		WHEN AA.arrival_date_month = 'May' THEN 5
		WHEN AA.arrival_date_month = 'June' THEN 6
		WHEN AA.arrival_date_month = 'July' THEN 7
		WHEN AA.arrival_date_month = 'August' THEN 8
		WHEN AA.arrival_date_month = 'September' THEN 9
		WHEN AA.arrival_date_month = 'October' THEN 10
		WHEN AA.arrival_date_month = 'November' THEN 11
		WHEN AA.arrival_date_month = 'December' THEN 12
	END AS months,
	avg_adr, total_canceled
FROM AA
JOIN BB ON AA.arrival_date_month = BB.arrival_date_month
ORDER BY months;

---------------------
-- slide 8
-- percentage cancelation over stays in week nights
WITH
	AA AS
	(
		SELECT
			stays_in_week_nights AS week,
			ROUND(COUNT(hotel) * 100.0 /
			(
				SELECT SUM(canceled)
				FROM
				(
					SELECT
						stays_in_week_nights,
						COUNT(hotel) AS canceled
					FROM hotels_cleaned
					WHERE is_canceled = 'Canceled'
					GROUP BY stays_in_week_nights
				) AS total_cancel	
			),2) AS ch_percent
		FROM hotels_cleaned
		WHERE hotel = 'City Hotel' AND is_canceled = 'Canceled'
		GROUP BY week
	),
	BB AS
	(
		SELECT
			stays_in_week_nights AS week,
			ROUND(COUNT(hotel) * 100.0 /
			(
				SELECT SUM(canceled)
				FROM
				(
					SELECT
						stays_in_week_nights,
						COUNT(hotel) AS canceled
					FROM hotels_cleaned
					WHERE is_canceled = 'Canceled'
					GROUP BY stays_in_week_nights
				) AS total_cancel	
			),2) AS rh_percent
		FROM hotels_cleaned
		WHERE hotel = 'Resort Hotel' AND is_canceled = 'Canceled'
		GROUP BY week
	)
SELECT AA.week, ch_percent, rh_percent
FROM AA
JOIN BB ON AA.week = BB.week;

-- percentage cancelation over stays in weekend nights
WITH
	AA AS
	(
		SELECT
			stays_in_weekend_nights AS week,
			ROUND(COUNT(hotel) * 100.0 /
			(
				SELECT SUM(canceled)
				FROM
				(
					SELECT
						stays_in_weekend_nights,
						COUNT(hotel) AS canceled
					FROM hotels_cleaned
					WHERE is_canceled = 'Canceled'
					GROUP BY stays_in_weekend_nights
				) AS total_cancel	
			),2) AS ch_percent
		FROM hotels_cleaned
		WHERE hotel = 'City Hotel' AND is_canceled = 'Canceled'
		GROUP BY week
	),
	BB AS
	(
		SELECT
			stays_in_weekend_nights AS week,
			ROUND(COUNT(hotel) * 100.0 /
			(
				SELECT SUM(canceled)
				FROM
				(
					SELECT
						stays_in_weekend_nights,
						COUNT(hotel) AS canceled
					FROM hotels_cleaned
					WHERE is_canceled = 'Canceled'
					GROUP BY stays_in_weekend_nights
				) AS total_cancel	
			),2) AS rh_percent
		FROM hotels_cleaned
		WHERE hotel = 'Resort Hotel' AND is_canceled = 'Canceled'
		GROUP BY week
	)
SELECT AA.week, ch_percent, rh_percent
FROM AA
JOIN BB ON AA.week = BB.week;