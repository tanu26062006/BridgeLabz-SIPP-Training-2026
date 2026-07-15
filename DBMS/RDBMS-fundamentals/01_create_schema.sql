-- DDL Commands for Task 1: Create COVID Database Schema

-- Table: covid_cases
CREATE TABLE IF NOT EXISTS covid_cases (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Country VARCHAR(100) NOT NULL,
    Date DATE NOT NULL,
    Confirmed_Cases INT DEFAULT 0,
    Recoveries INT DEFAULT 0
);

-- Table: covid_deaths
CREATE TABLE IF NOT EXISTS covid_deaths (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Country VARCHAR(100) NOT NULL,
    Date DATE NOT NULL,
    Deaths INT DEFAULT 0,
    Population INT DEFAULT 0
);

-- Table: covid_vaccines
CREATE TABLE IF NOT EXISTS covid_vaccines (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Country VARCHAR(100) NOT NULL,
    Date DATE NOT NULL,
    Total_Doses_Administered BIGINT DEFAULT 0,
    First_Dose_Administered BIGINT DEFAULT 0,
    Second_Dose_Administered BIGINT DEFAULT 0
);
