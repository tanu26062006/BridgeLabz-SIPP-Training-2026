USE covid_19;

-- Use Case 1 & 2
-- Create Countries Table

CREATE TABLE countries (
    country VARCHAR(50) PRIMARY KEY,
    continent VARCHAR(50),
    population BIGINT
);

INSERT INTO countries (country, continent, population)
VALUES
('India', 'Asia', 1393409038),
('United States', 'North America', 331893745),
('Brazil', 'South America', 213993437),
('United Kingdom', 'Europe', 68207114),
('Japan', 'Asia', 125836021);

-- Use Case 3
-- Add NOT NULL Constraints

ALTER TABLE covid_cases
MODIFY country VARCHAR(50) NOT NULL;

ALTER TABLE covid_cases
MODIFY report_date DATE NOT NULL;

ALTER TABLE covid_cases
MODIFY confirmed_cases INT NOT NULL;

-- Use Case 1
-- Add Composite Primary Key

ALTER TABLE covid_cases
ADD PRIMARY KEY (country, report_date);

-- Use Case 2
-- Add Foreign Key

ALTER TABLE covid_cases
ADD CONSTRAINT fk_country
FOREIGN KEY (country)
REFERENCES countries(country);

-- Use Case 3
-- Add CHECK Constraint

ALTER TABLE covid_cases
ADD CONSTRAINT chk_deaths
CHECK (deaths <= confirmed_cases);

-- Use Case 4
-- Set Default Values

ALTER TABLE covid_cases
MODIFY recoveries INT DEFAULT 0;

ALTER TABLE covid_cases
ADD last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- View Final Table Structure

DESC covid_cases;

-- Display Data

SELECT * FROM countries;
SELECT * FROM covid_cases;