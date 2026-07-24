-- =====================================================
-- SESSION 5: VIEWS, STORED PROCEDURES & FUNCTIONS
-- USE CASES 21 TO 25
-- =====================================================


-- =====================================================
-- USE CASE 21: CREATE VIEW FOR LATEST COVID DATA
-- =====================================================

CREATE VIEW LatestCovidData AS
SELECT
    c.Country,
    c.Date,
    c.Confirmed,
    c.Deaths,
    c.Recovered
FROM covid_cases c
JOIN (
    SELECT
        Country,
        MAX(Date) AS LatestDate
    FROM covid_cases
    GROUP BY Country
) latest
ON c.Country = latest.Country
AND c.Date = latest.LatestDate;


-- View the result
SELECT * FROM LatestCovidData;



-- =====================================================
-- USE CASE 22: BUILD MORTALITY RATE FUNCTION
-- Formula: (Deaths / Confirmed) * 100
-- =====================================================

DELIMITER //

CREATE FUNCTION CalculateMortalityRate(
    p_country VARCHAR(100),
    p_date DATE
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN

    DECLARE mortality_rate DECIMAL(10,2);

    SELECT
        CASE
            WHEN Confirmed = 0 THEN 0
            ELSE (Deaths * 100.0 / Confirmed)
        END
    INTO mortality_rate
    FROM covid_cases
    WHERE Country = p_country
    AND Date = p_date
    LIMIT 1;

    RETURN mortality_rate;

END //

DELIMITER ;


-- Test Mortality Rate Function
SELECT CalculateMortalityRate(
    'India',
    '2026-07-20'
) AS MortalityRate;



-- =====================================================
-- USE CASE 23: CREATE STORED PROCEDURE FOR DATA UPDATES
-- =====================================================

DELIMITER //

CREATE PROCEDURE UpdateCovidStats(
    IN p_country VARCHAR(100),
    IN p_date DATE,
    IN p_confirmed INT,
    IN p_deaths INT,
    IN p_recovered INT
)
BEGIN

    START TRANSACTION;

    UPDATE covid_cases
    SET
        Confirmed = p_confirmed,
        Deaths = p_deaths,
        Recovered = p_recovered
    WHERE Country = p_country
    AND Date = p_date;

    COMMIT;

END //

DELIMITER ;


-- Test Stored Procedure
CALL UpdateCovidStats(
    'India',
    '2026-07-20',
    550000,
    5500,
    520000
);


-- Check Updated Data
SELECT *
FROM covid_cases
WHERE Country = 'India'
AND Date = '2026-07-20';



-- =====================================================
-- USE CASE 24: IMPLEMENT RECOVERY RATE FUNCTION
-- Formula: (Recovered / Confirmed) * 100
-- =====================================================

DELIMITER //

CREATE FUNCTION CalculateRecoveryRate(
    p_country VARCHAR(100)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN

    DECLARE recovery_rate DECIMAL(10,2);

    SELECT
        CASE
            WHEN Confirmed = 0 THEN 0
            ELSE (Recovered * 100.0 / Confirmed)
        END
    INTO recovery_rate
    FROM covid_cases
    WHERE Country = p_country
    ORDER BY Date DESC
    LIMIT 1;

    RETURN recovery_rate;

END //

DELIMITER ;


-- Test Recovery Rate Function
SELECT CalculateRecoveryRate(
    'India'
) AS RecoveryRate;



-- =====================================================
-- USE CASE 25: CREATE AUDIT TRIGGER FOR DATA CHANGES
-- =====================================================


-- Step 1: Create Audit Table

CREATE TABLE covid_cases_audit (

    audit_id INT AUTO_INCREMENT PRIMARY KEY,

    covid_id INT,

    Country VARCHAR(100),

    Date DATE,

    old_confirmed INT,
    new_confirmed INT,

    old_deaths INT,
    new_deaths INT,

    old_recovered INT,
    new_recovered INT,

    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- Step 2: Create Audit Trigger

DELIMITER //

CREATE TRIGGER covid_cases_update_audit

AFTER UPDATE ON covid_cases

FOR EACH ROW

BEGIN

    INSERT INTO covid_cases_audit (

        covid_id,

        Country,

        Date,

        old_confirmed,
        new_confirmed,

        old_deaths,
        new_deaths,

        old_recovered,
        new_recovered
    )

    VALUES (

        OLD.id,

        OLD.Country,

        OLD.Date,

        OLD.Confirmed,
        NEW.Confirmed,

        OLD.Deaths,
        NEW.Deaths,

        OLD.Recovered,
        NEW.Recovered
    );

END //

DELIMITER ;



-- =====================================================
-- TEST AUDIT TRIGGER
-- =====================================================

UPDATE covid_cases

SET
    Confirmed = 600000,
    Deaths = 6000,
    Recovered = 570000

WHERE Country = 'India'
AND Date = '2026-07-20';



-- Check Audit History

SELECT *
FROM covid_cases_audit;



-- =====================================================
-- FINAL CHECKS
-- =====================================================


-- Check Latest COVID Data View

SELECT *
FROM LatestCovidData;


-- Check Mortality Rate

SELECT CalculateMortalityRate(
    'India',
    '2026-07-20'
) AS MortalityRate;


-- Check Recovery Rate

SELECT CalculateRecoveryRate(
    'India'
) AS RecoveryRate;


-- Check COVID Table

SELECT *
FROM covid_cases;


-- Check Audit Table

SELECT *
FROM covid_cases_audit;