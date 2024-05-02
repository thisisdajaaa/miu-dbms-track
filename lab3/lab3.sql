CREATE TABLE college (
    id int NOT NULL UNIQUE,
    cname varchar(50) UNIQUE,
    coffice varchar(255),
    cphone varchar(50),
    dean int,
    PRIMARY KEY (id)
)

CREATE TABLE instructor (
    id int NOT NULL UNIQUE,
    iname varchar(50),
    ioffice varchar(50),
    iphone varchar(50),
    rank varchar(50),
    department_id int,
    PRIMARY KEY (id)
)

CREATE TABLE department (
    id int NOT NULL UNIQUE,
    dname varchar(50) UNIQUE,
    dcode varchar(50) UNIQUE
    doffice varchar(255),
    dphone varchar(50),
    college_id int,
    chair int,
    chair_start_date date,
    PRIMARY KEY (id),
    FOREIGN KEY (college_id) REFERENCES college (id),
    FOREIGN KEY (chair) REFERENCES instructor (id)
)

ALTER TABLE college ADD FOREIGN KEY (dean) REFERENCES instructor (id)
ALTER TABLE instructor ADD FOREIGN KEY (department_id) REFERENCES department (id)

CREATE TABLE course (
    id int NOT NULL UNIQUE,
    cname varchar(50) UNIQUE,
    ccode varchar(50) UNIQUE,
    clevel tinyint,
    ccredits decimal,
    cdesc varchar(255),
    department_id int,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department (id)
)

CREATE TABLE student (
    id int NOT NULL UNIQUE,
    sname varchar(50),
    address varchar(255),
    phone varchar(50),
    major_code varchar(50),
    birthdate date,
    department_id int,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department (id)
)

CREATE TABLE section (
    id int NOT NULL UNIQUE,
    sec_no int,
    ssem tinyint,
    syear year,
    croom varchar(50),
    PRIMARY KEY (id)
)

CREATE TABLE student_section (
    id int NOT NULL UNIQUE,
    student_id int,
    section_id int,
    grade float,
    daystime varchar(50),
    FOREIGN KEY (student_id) REFERENCES student (id),
    FOREIGN KEY (section_id) REFERENCES section (id),
)