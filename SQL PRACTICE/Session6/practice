-- =====================================================
-- SESSION 6: INDEXING & ACID PROPERTIES
-- USE CASES 26 TO 30
-- =====================================================


-- =====================================================
-- USE CASE 26
-- Create Indexes on Frequently Searched Columns
-- =====================================================

-- Composite index on Country and Date
CREATE INDEX idx_country_date
ON covid_cases(Country, Date);

-- Single-column index on Date
CREATE INDEX idx_date
ON covid_cases(Date);

-- Check created indexes
SHOW INDEX FROM covid_cases;

-- Example query using Country + Date
SELECT *
FROM covid_cases
WHERE Country = 'India'
AND Date = '2026-07-20';

-- Example query using Date
SELECT *
FROM covid_cases
WHERE Date = '2026-07-20';


-- =====================================================
-- USE CASE 27
-- Optimize Top 10 High Infection Rate Queries
-- =====================================================

-- Covering index
CREATE INDEX idx_infection_rate_country
ON covid_cases(infection_rate, Country);

-- Top 10 countries by infection rate
SELECT Country, infection_rate
FROM covid_cases
ORDER BY infection_rate DESC
LIMIT 10;

-- Check whether index is being used
EXPLAIN
SELECT Country, infection_rate
FROM covid_cases
ORDER BY infection_rate DESC
LIMIT 10;


-- =====================================================
-- USE CASE 28
-- Analyze Query Execution Plans
-- =====================================================

-- Analyze Country + Date query
EXPLAIN
SELECT *
FROM covid_cases
WHERE Country = 'India'
AND Date = '2026-07-20';


-- Analyze infection rate query
EXPLAIN
SELECT Country, infection_rate
FROM covid_cases
ORDER BY infection_rate DESC
LIMIT 10;


-- Create index for JOIN column if required
CREATE INDEX idx_vaccine_country
ON vaccine_distribution(Country);


-- Analyze JOIN query
EXPLAIN
SELECT
    c.Country,
    c.Date,
    c.Confirmed,
    v.total_vaccinations
FROM covid_cases c
JOIN vaccine_distribution v
ON c.Country = v.Country
WHERE c.Country = 'India';


-- =====================================================
-- USE CASE 29
-- Implement ACID Transaction for Vaccine Data
-- =====================================================

START TRANSACTION;

INSERT INTO vaccine_distribution
(Country, Date, total_vaccinations)
VALUES
('India', '2026-07-20', 1000000);

INSERT INTO vaccine_distribution
(Country, Date, total_vaccinations)
VALUES
('USA', '2026-07-20', 800000);

COMMIT;


-- Check inserted records
SELECT *
FROM vaccine_distribution;


-- =====================================================
-- ROLLBACK EXAMPLE
-- =====================================================

START TRANSACTION;

INSERT INTO vaccine_distribution
(Country, Date, total_vaccinations)
VALUES
('Japan', '2026-07-20', 500000);

-- Undo the transaction
ROLLBACK;

-- Japan record should not be saved
SELECT *
FROM vaccine_distribution
WHERE Country = 'Japan';


-- =====================================================
-- USE CASE 30
-- Demonstrate Isolation Levels
-- =====================================================


-- =====================================================
-- 1. DIRTY READ
-- =====================================================

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

START TRANSACTION;

SELECT *
FROM vaccine_distribution
WHERE Country = 'India';

COMMIT;


-- To prevent dirty reads:
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;


-- =====================================================
-- 2. NON-REPEATABLE READ
-- =====================================================

SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT total_vaccinations
FROM vaccine_distribution
WHERE Country = 'India';

-- Another transaction can update and COMMIT here.

SELECT total_vaccinations
FROM vaccine_distribution
WHERE Country = 'India';

COMMIT;


-- Prevent non-repeatable reads:
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;


-- =====================================================
-- 3. PHANTOM READ
-- =====================================================

SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT *
FROM vaccine_distribution
WHERE total_vaccinations > 500000;

-- Another transaction can insert a matching row
-- and COMMIT here.

SELECT *
FROM vaccine_distribution
WHERE total_vaccinations > 500000;

COMMIT;


-- Strongest isolation level to prevent phantom reads:
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;


-- =====================================================
-- DISPLAY CURRENT ISOLATION LEVEL
-- =====================================================

SELECT @@transaction_isolation;


-- =====================================================
-- FINAL CHECKS
-- =====================================================

SHOW INDEX FROM covid_cases;

SELECT *
FROM covid_cases;

SELECT *
FROM vaccine_distribution;