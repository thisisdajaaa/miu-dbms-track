INSERT INTO
    college (CName, COffice, CPhone, Dean)
VALUES
    ("College1", "asd", "123", 1),
    ("College2", "asd", "123", 2),
    ("College3", "asd", "123", 3);

INSERT INTO
    department (
        DName,
        DCode,
        DOffice,
        DPhone,
        Chair,
        CName,
        CStartDate
    )
VALUES
    (
        "Dept1",
        "dept1",
        "123",
        "123",
        1,
        "College1",
        "2024-05-15"
    ),
    (
        "Dept2",
        "dept2",
        "123",
        "123",
        1,
        "College1",
        "2024-05-15"
    ),
    (
        "Dept3",
        "dept3",
        "123",
        "123",
        1,
        "College1",
        "2024-05-15"
    );

INSERT INTO
    course (CoName, CCode, CLevel, Credits, CDesc, DCode)
VALUES
    (
        "Course1",
        "course1",
        1,
        1,
        "asd",
        "dept1"
    ),
    (
        "Course2",
        "course2",
        1,
        1,
        "asd",
        "dept1"
    ),
    (
        "Course3",
        "course3",
        1,
        1,
        "asd",
        "dept1"
    );

INSERT INTO
    instructor (Id, IName, IOffice, IPhone, Rank, DCode)
VALUES
    (1, "ins1", "asd", "asd", "asd", "dept1"),
    (2, "ins2", "asd", "asd", "asd", "dept1"),
    (3, "ins3", "asd", "asd", "asd", "dept1");

INSERT INTO
    student (SId, SName, Addr, Phone, Major, DoB, DCode)
VALUES
    (
        1,
        "student1",
        "asd",
        "asd",
        "asd",
        "2024-05-15",
        "dept1"
    ),
    (
        2,
        "student2",
        "asd",
        "asd",
        "asd",
        "2024-05-15",
        "dept1"
    ),
    (
        3,
        "student3",
        "asd",
        "asd",
        "asd",
        "2024-05-15",
        "dept1"
    );

INSERT INTO
    section (
        SecId,
        Sem,
        Year,
        CRoom,
        DaysTime,
        Instructor,
        Course
    )
VALUES
    (1, 1, 2024, "asd", "asd", 1, "course1"),
    (2, 1, 2024, "asd", "asd", 1, "course1"),
    (3, 1, 2024, "asd", "asd", 1, "course1");

INSERT INTO
    student_section (Id, SId, SecId)
VALUES
    (1, 1, 1, 3.5),
    (2, 2, 2, 4.0),
    (3, 3, 3, 5.0);