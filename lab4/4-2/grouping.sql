/** 5.22 **/
SELECT
    h.hotelName,
    COUNT(r.roomNo) AS num_of_rooms
FROM
    room r
    INNER JOIN hotel h ON h.hotelNo = r.hotelNo
GROUP BY
    h.hotelName;

/** 5.23 **/
SELECT
    h.hotelName,
    COUNT(r.roomNo) AS roomCount
FROM
    hotel h
    INNER JOIN room r ON h.hotelNo = r.hotelNo
WHERE
    h.city = 'London'
GROUP BY
    h.hotelName
ORDER BY
    h.hotelName;

/** 5.24 **/
SELECT
    h.hotelName,
    AVG(bookingCount) AS avgBookings
FROM
    (
        SELECT
            b.hotelNo,
            COUNT(b.guestNo) AS bookingCount
        FROM
            booking b
        WHERE
            MONTH(b.dateFrom) = 8
            OR MONTH(b.dateTo) = 8
        GROUP BY
            b.hotelNo
    ) AS hotelBookings
    INNER JOIN hotel h ON h.hotelNo = hotelBookings.hotelNo
GROUP BY
    h.hotelName
ORDER BY
    h.hotelName;

/** 5.25 **/
SELECT
    hotelInfo.type,
    hotelInfo.hotelName,
    COUNT(hotelInfo.roomCount)
FROM
    (
        SELECT
            r.type,
            h.hotelName,
            COUNT(b.roomNo) AS roomCount
        FROM
            booking b
            INNER JOIN hotel h ON b.hotelNo = h.hotelNo
            INNER JOIN room r ON r.roomNo = b.roomNo
        WHERE
            h.city = 'London'
        GROUP BY
            r.type
    ) AS hotelInfo
GROUP BY
    hotelInfo.hotelName;

/** 5.26 **/
SELECT
    h.hotelName,
    SUM(r.price) AS lostIncome
FROM
    hotel h
    INNER JOIN room r ON h.hotelNo = r.hotelNo
    LEFT JOIN booking b ON r.hotelNo = b.hotelNo
    AND r.roomNo = b.roomNo
    AND CURRENT_DATE() BETWEEN b.dateFrom
    AND b.dateTo
WHERE
    b.guestNo IS NULL
GROUP BY
    h.hotelName
ORDER BY
    h.hotelName;

/** 5.28 **/
UPDATE
    room
SET
    price = price * 1.05;