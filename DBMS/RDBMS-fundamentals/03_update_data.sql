-- DML Command for Task 3: Update Case Information

-- Scenario: Update India's confirmed cases on 2020-02-02 to 5 cases (originally 3)
UPDATE covid_cases
SET Confirmed_Cases = 5
WHERE Country = 'India' AND Date = '2020-02-02';
