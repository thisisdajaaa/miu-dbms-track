/** 5.16 **/
SELECT
    r.price,
    r.type
FROM
    room r
WHERE
    r.hotelNo = (
        SELECT
            h.hotelNo
        FROM
            hotel h
        WHERE
            h.hotelName = 'Grosvenor Hotel'
    );

/** 5.17 **/
SELECT
    g.guestNo,
    g.guestName,
    g.guestAddress
FROM
    guest g
WHERE
    g.guestNo IN (
        SELECT
            b.guestNo
        FROM
            booking b
            INNER JOIN hotel h ON b.hotelNo = h.hotelNo
        WHERE
            h.hotelName = 'Grosvenor Hotel'
            AND b.dateFrom <= CURRENT_DATE()
            AND b.dateTo >= CURRENT_DATE()
    );

/** 5.18 **/
SELECT
    r.roomNo,
    r.hotelNo,
    r.type,
    r.price,
    g.guestName,
    CASE
        WHEN g.guestName IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS is_occupied
FROM
    room r
    LEFT JOIN booking b ON r.roomNo = b.roomNo
    AND r.hotelNo = b.hotelNo
    LEFT JOIN guest g ON b.guestNo = g.guestNo
WHERE
    r.hotelNo = (
        SELECT
            h.hotelNo
        FROM
            hotel h
        WHERE
            h.hotelName = 'Grosvenor Hotel'
    );

/** 5.19 **/
SELECT
    SUM(r.price)
FROM
    booking b
    INNER JOIN room r ON b.hotelNo = r.hotelNo
    AND b.roomNo = r.roomNo
WHERE
    b.hotelNo = (
        SELECT
            h.hotelNo
        FROM
            hotel h
        WHERE
            h.hotelName = 'Grosvenor Hotel'
    )
    AND CURRENT_DATE BETWEEN b.dateFrom
    AND b.dateTo;

/** 5.20 **/
SELECT
    r.roomNo,
    r.hotelNo,
    r.type,
    r.price
FROM
    room r
WHERE
    r.hotelNo = (
        SELECT
            h.hotelNo
        FROM
            hotel h
        WHERE
            h.hotelName = 'Grosvenor Hotel'
    )
    AND r.roomNo NOT IN (
        SELECT
            b.roomNo
        FROM
            booking b
        WHERE
            CURRENT_DATE BETWEEN b.dateFrom
            AND b.dateTo
    );

/** 5.21 **/
SELECT
    SUM(r.price) AS lost_price
FROM
    room r
WHERE
    r.hotelNo = (
        SELECT
            h.hotelNo
        FROM
            hotel h
        WHERE
            h.hotelName = 'Grosvenor Hotel'
    )
    AND r.roomNo NOT IN (
        SELECT
            b.roomNo
        FROM
            booking b
        WHERE
            CURRENT_DATE BETWEEN b.dateFrom
            AND b.dateTo
    );