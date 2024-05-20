CREATE TABLE college (
    CName varchar(255) UNIQUE,
    COffice varchar(255),
    CPhone varchar(255),
    Dean int,
    PRIMARY KEY (CName)
);

CREATE TABLE department (
    DName varchar(255),
    DCode varchar(255) UNIQUE,
    DOffice varchar(255),
    DPhone varchar(255),
    Chair int,
    CName varchar(255),
    CStartDate date,
    PRIMARY KEY(DCode),
    FOREIGN KEY (CName) REFERENCES college (CName)
);

CREATE TABLE course (
    CoName varchar(255) UNIQUE,
    CCode varchar(255) UNIQUE,
    CLevel tinyint,
    Credits int,
    CDesc text,
    DCode varchar(255),
    PRIMARY KEY (CCode),
    FOREIGN KEY (DCode) REFERENCES department (DCode)
);

CREATE TABLE course_prerequisite (
    Id int,
    CCode varchar(255),
    Prerequisite varchar(255),
    PRIMARY KEY (Id),
    FOREIGN KEY (CCode) REFERENCES course (CCode),
    FOREIGN KEY (Prerequisite) REFERENCES course (CCode)
);

CREATE TABLE instructor (
    Id int,
    IName varchar(255),
    IOffice varchar(255),
    IPhone varchar(255),
    Rank varchar(255),
    DCode varchar(255),
    PRIMARY KEY (Id),
    FOREIGN KEY (DCode) REFERENCES department (DCode)
);

ALTER TABLE
    college
ADD
    FOREIGN KEY (Dean) REFERENCES instructor (Id);

ALTER TABLE
    department
ADD
    FOREIGN KEY (Chair) REFERENCES instructor (Id);

CREATE TABLE student (
    SId int,
    SName varchar(255),
    Addr varchar(255),
    Phone varchar(255),
    Major varchar(255),
    DoB date,
    DCode varchar(255),
    PRIMARY KEY (SId),
    FOREIGN KEY (DCode) REFERENCES department (DCode)
);

CREATE TABLE section (
    SecId int,
    Sem tinyint,
    Year year,
    CRoom varchar(255),
    DaysTime varchar(255),
    Instructor int,
    Course varchar(255),
    PRIMARY KEY (SecId),
    FOREIGN KEY (Instructor) REFERENCES instructor (Id),
    FOREIGN KEY (Course) REFERENCES course (CCode)
);

CREATE TABLE student_section (
    Id int,
    SId int,
    SecId int,
    Grade double,
    PRIMARY KEY (Id),
    FOREIGN KEY (SId) REFERENCES student (SId),
    FOREIGN KEY (SecId) REFERENCES section (SecId)
);