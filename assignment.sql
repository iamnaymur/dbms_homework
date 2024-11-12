-- 1
CREATE TABLE
    Staff (
        StaffNo INT PRIMARY KEY,
        FirstName VARCHAR(20),
        Position VARCHAR(50),
        Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
        Birth_year INT CHECK (Birth_year >= 0),
        AnnualSalary DECIMAL(10, 2) DEFAULT 1000
    );

-- 2
SELECT
    StaffNo
FROM
    Staff
WHERE
    Birth_year > 1990
    AND (
        Gender = 'M'
        OR Gender = 'F'
    );

--3
SELECT
    StaffNo,
    FirstName,
    AnnualSalary / 2 AS HalfYearlySalary
FROM
    Staff;

--4
SELECT
    SUM(AnnualSalary) AS TotalMaleSalary
FROM
    Staff
WHERE
    Gender = 'M';

--5
ALTER TABLE Staff MODIFY FirstName VARCHAR(200);

--6
CREATE TABLE
    Staff2 AS
SELECT
    *
FROM
    Staff
WHERE
    AnnualSalary > 12000;

--7SELECT Position, COUNT(*) AS NumberOfStaff
FROM
    Staff
GROUP BY
    Position;

--8
SELECT
    FirstName,
    StaffNo
FROM
    Staff
WHERE
    Birth_year = (
        SELECT
            MIN(Birth_year)
        FROM
            Staff
    );

--9
SELECT
    FirstName
FROM
    Staff
WHERE
    LENGTH (FirstName) <= 5
    AND FirstName LIKE '%asa%';

--10
UPDATE Staff
SET
    Birth_year = COALESCE(Birth_year, 1990),
    Birth_year = (Birth_year - 3) * 365;