-- DML Commands for Task 2: Insert Initial COVID Data

-- Insert sample records into covid_cases
INSERT INTO covid_cases (Country, Date, Confirmed_Cases, Recoveries) VALUES
('India', '2020-01-30', 1, 0),
('India', '2020-02-02', 3, 0),
('India', '2020-03-11', 60, 4),
('USA', '2020-01-20', 1, 0),
('USA', '2020-02-15', 15, 3),
('USA', '2020-03-10', 1000, 15),
('UK', '2020-01-31', 2, 0),
('UK', '2020-02-28', 20, 8),
('UK', '2020-03-15', 500, 20);

-- Insert incorrect records for Task 4 demonstration
-- 1. Country code 'IN' instead of 'India'
INSERT INTO covid_cases (Country, Date, Confirmed_Cases, Recoveries) VALUES
('IN', '2020-03-12', 75, 5);

-- 2. Duplicate record (exact same country and date as an existing valid record)
INSERT INTO covid_cases (Country, Date, Confirmed_Cases, Recoveries) VALUES
('India', '2020-01-30', 1, 0);
