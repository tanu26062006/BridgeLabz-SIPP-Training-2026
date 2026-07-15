-- DDL Command for Task 5: Alter Table to Add Vaccination Information

-- Add vaccination_rate column to covid_cases to store percentage of vaccinated population
ALTER TABLE covid_cases
ADD COLUMN vaccination_rate DECIMAL(5,2);
