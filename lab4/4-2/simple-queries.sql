/** 5.7 **/
SELECT
    *
FROM
    hotel;

/** 5.8 **/
SELECT
    *
FROM
    hotel
WHERE
    city = 'London';

/** 5.9 **/
SELECT
    guest.guestName,
    guest.guestAddress
FROM
    booking
    INNER JOIN guest ON booking.guestNo = guest.guestNo
    INNER JOIN hotel ON booking.hotelNo = hotel.hotelNo
WHERE
    hotel.city = "London"
ORDER BY
    guest.guestName ASC;

/** 5.10 **/
SELECT
    *
FROM
    room
WHERE
    type = 'Family'
    OR type = 'Double'
    AND price < 40
ORDER BY
    price;

/** 5.11 **/
SELECT
    *
FROM
    booking
WHERE
    dateTo IS NULL;