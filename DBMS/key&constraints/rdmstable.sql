create database covid_19;

CREATE TABLE covid_cases (
    country VARCHAR(50),
    report_date DATE,
    confirmed_cases INT,
    deaths INT,
    recoveries INT,
    population BIGINT
);
SELECT * FROM covid_cases;

CREATE TABLE covid_deaths (
    country VARCHAR(50),
    report_date DATE,
    total_deaths INT
);
SELECT * FROM covid_deaths;

CREATE TABLE covid_vaccines (
    country VARCHAR(50),
    report_date DATE,
    vaccinated_people BIGINT
);
SELECT * FROM covid_vaccines;
INSERT INTO covid_cases
(country, report_date, confirmed_cases, deaths, recoveries, population)
VALUES
('India', '2022-01-01', 34800000, 481000, 34200000, 1393409038),
('United States', '2022-01-01', 55000000, 825000, 43000000, 331893745),
('Brazil', '2022-01-01', 22300000, 619000, 21500000, 213993437),
('United Kingdom', '2022-01-01', 13000000, 149000, 11000000, 68207114),
('Japan', '2022-01-01', 1740000, 18400, 1730000, 125836021);

ALTER TABLE covid_cases
ADD vaccination_rate DECIMAL(5,2);
UPDATE covid_cases
SET vaccination_rate = 78.50
WHERE country = 'India';
DESC covid_cases;

UPDATE covid_cases
SET confirmed_cases = 45200000
WHERE country = 'India'
AND report_date = '2024-02-01';

SELECT *
FROM covid_cases
WHERE country = 'India';

DELETE FROM covid_cases
WHERE country = 'IN';

DELETE FROM covid_cases
WHERE country = 'India'
AND report_date = '2024-01-01'
LIMIT 1;

SELECT * FROM covid_cases;