/** 5.12 **/
SELECT
    COUNT(*) AS hotel_count
FROM
    hotel;

/** 5.13 **/
SELECT
    AVG(price) as room_avg_price
FROM
    room;

/** 5.14 **/
SELECT
    SUM(price) AS total_revenue_per_night
FROM
    room
WHERE
    type = 'Double';

/** 5.15 **/
SELECT
    COUNT(DISTINCT guestNo)
FROM
    booking
WHERE
    MONTH(dateFrom) = 8
    OR MONTH(dateTo) = 8;