-- DML Commands for Task 4: Delete Incorrect and Duplicate Records

-- 1. Delete records where country name was entered incorrectly (e.g., 'IN' instead of 'India')
DELETE FROM covid_cases
WHERE Country = 'IN';

-- 2. Delete duplicate records for the same country and date, keeping only the first entry (lowest id)
-- Note: This syntax works in SQLite, PostgreSQL, and SQL Server.
DELETE FROM covid_cases
WHERE id NOT IN (
    SELECT MIN(id)
    FROM covid_cases
    GROUP BY Country, Date
);
