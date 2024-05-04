CREATE TABLE hotel (
    hotelNo int NOT NULL UNIQUE,
    hotelName varchar(255),
    city varchar(255),
    PRIMARY KEY (hotelNo)
);

CREATE TABLE room (
    roomNo int NOT NULL UNIQUE,
    hotelNo int,
    type varchar(255),
    price int,
    PRIMARY KEY (roomNo, hotelNo),
    FOREIGN KEY (hotelNo) REFERENCES hotel (hotelNo)
);

CREATE TABLE guest (
    guestNo int NOT NULL UNIQUE,
    guestName varchar(255),
    guestAddress varchar(255),
    PRIMARY KEY (guestNo)
);

CREATE TABLE booking (
    hotelNo int,
    guestNo int,
    dateFrom date,
    dateTo date,
    roomNo int,
    PRIMARY KEY (hotelNo, guestNo, dateFrom),
    FOREIGN KEY (hotelNo) REFERENCES hotel (hotelNo),
    FOREIGN KEY (guestNo) REFERENCES guest (guestNo),
    FOREIGN KEY (roomNo) REFERENCES room (roomNo)
);