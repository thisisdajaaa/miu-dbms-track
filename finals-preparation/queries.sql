/** Query 1 **/
WITH course_count AS (
    SELECT
        DCode,
        COUNT(*) AS dep_course_count
    FROM
        course
    GROUP BY
        DCode
)
SELECT
    d.DName,
    d.DCode,
    cc.dep_course_count
FROM
    course_count cc
    JOIN department d ON d.DCode = cc.DCode
WHERE
    cc.dep_course_count > 10;

/** Query 2 **/
SELECT
    s.DCode,
    AVG(ss.Grade)
FROM
    student_section ss
    JOIN student s ON s.SId = ss.SId
GROUP BY
    s.DCode;

/** Query 3 **/
SELECT
    DISTINCT c.CoName,
    c.CCode,
    i.IName
FROM
    section s
    JOIN instructor i ON i.Id = s.Instructor
    JOIN course c ON c.CCode = s.Course;

/** Query 4 **/
SELECT
    s.SId,
    s.SName,
    c.CoName
FROM
    student_section ss
    JOIN student s ON s.SId = ss.SId
    JOIN section sec ON sec.SecId = ss.SecId
    JOIN course c ON sec.Course = c.CCode
    JOIN department d ON c.DCode = d.DCode
WHERE
    d.DName = 'Computer Science';

/** Query 5 **/
SELECT
    i.IName,
    COUNT(sec.Course)
FROM
    section sec
    JOIN instructor i ON i.Id = sec.instructor
GROUP BY
    i.IName
HAVING
    COUNT(sec.Course) > 3;

/** Query 6 **/
SELECT
    ss.SecId,
    COUNT(ss.SId)
FROM
    student_section
GROUP BY
    ss.SecID;

/** Query 7 **/
WITH student_avg AS (
    SELECT
        ss.SId,
        AVG(ss.Grade) as student_avg_grade
    FROM
        student_section ss
    HAVING
        student_avg_grade > 3.5
),
department_count AS (
    SELECT
        DISTINCT d.DName,
        d.DCode,
        COUNT(*) as student_count
    FROM
        student_avg sa
        JOIN student s ON s.SId = sa.SId
        JOIN department d ON d.DCode = s.DCode
)
SELECT
    dc.DName,
    dc.DCode,
    dc.student_count
FROM
    department_count dc
WHERE
    dc.student_count >= 1;

/** Query 8 **/
SELECT
    *
FROM
    student
WHERE
    Major IS NULL;

/** Query 9 **/
SELECT
    ss.SId s.SName
FROM
    student_section ss
    JOIN section sec ON sec.SecId = ss.SecId
    JOIN student s ON s.SId = ss.SId
    JOIN instructor i ON i.Id = sec.Instructor
WHERE
    i.IName = 'Dr. Smith';

/** Query 10 **/
SELECT
    sec.Course,
    sec.Sem,
    COUNT(ss.SId)
FROM
    student_section ss
    JOIN section sec ON sec.SecId = ss.SecId
GROUP BY
    sec.Course,
    sec.Sem;

/** Query 11 **/
SELECT
    c.CoName,
    c.CCode
FROM
    course c
WHERE
    c.CCode IN (
        SELECT
            CCode
        FROM
            course_prerequisite
    );

/** Query 12 **/
SELECT
    s.SId,
    s.DCode,
    AVG(ss.Grade) as avg_grade
FROM
    student_section ss
    JOIN student s ON s.SId = ss.SId
GROUP BY
    s.SId,
    s.DCode
ORDER BY
    avg_grade DESC
LIMIT
    3;

/** Query 13 **/
SELECT
    c.CCode,
    (
        SELECT
            CCode
        FROM
            course
        WHERE
            cp.Prerequisite = CCode
    ) as Prerequisite
FROM
    course_prerequisite cp ON c.CCode = cp.CCode;

/** Query 14 **/
UPDATE
    student
SET
    Phone = '999-999-9999'
WHERE
    CONTAINS(Addr, 'New York City');

/** QUERY 15 **/
SELECT
    i.IName,
    COUNT(i.DCode)
FROM
    instructor i
WHERE
    i.Id IN (
        SELECT
            Instructor
        FROM
            section
    )
GROUP BY
    i.IName
HAVING
    COUNT(i.DCode) > 1;

/** QUERY 16 **/
SELECT
    s.SId,
    s.SName
FROM
    student s
WHERE
    s.SId NOT IN (
        SELECT
            SId
        FROM
            student_section
    );

/**
 * Candidate keys: Order ID === Primary Key
 * 3NF
 * Order Table
 * Order ID
 * Customer ID
 * Product ID
 * Quantity
 * OrderDate
 *
 * Customer Table
 * Customer ID
 * Customer Name
 *
 * Product Table
 * Product ID
 * Product Name
 * Price
 * 
 * Explanation, this is already in 1NF and 2NF since the columnv values are atomic and the Order ID is the only primary key
 * However this breaks 3NF since CustomerName and address are transitive dependencies of CustomerID and also Product Name and Price are transitive dependencies of Product ID 
 **/