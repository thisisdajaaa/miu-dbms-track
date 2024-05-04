INSERT INTO
    hotel (hotelNo, hotelName, city)
VALUES
    (101, 'Ocean View', 'Santa Monica'),
    (102, 'London Bridge Hotel', 'London'),
    (103, 'Grosvenor Hotel', 'Los Angeles');

INSERT INTO
    room (roomNo, hotelNo, type, price)
VALUES
    (1, 101, 'Suite', 300),
    (2, 101, 'Double', 200),
    (3, 102, 'Suite', 250),
    (4, 102, 'Family', 39),
    (5, 103, 'Family', 25),
    (6, 103, 'Double', 220);

INSERT INTO
    guest (guestNo, guestName, guestAddress)
VALUES
    (201, 'John Doe', '123 Elm St'),
    (202, 'Jane Smith', '456 Oak St'),
    (203, 'Jim Brown', '789 Pine St');

INSERT INTO
    booking (hotelNo, guestNo, dateFrom, dateTo, roomNo)
VALUES
    (101, 201, '2024-01-01', '2024-01-05', 1),
    (102, 202, '2024-01-06', '2024-01-15', 2),
    (102, 203, '2024-01-10', '2024-01-20', 3),
    (103, 201, '2024-01-15', '2024-01-25', 4);