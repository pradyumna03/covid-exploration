SELECT * FROM covid.coviddeaths
WHERE continent IS NOT NULL
ORDER BY 3,4;

-- Data to start with 

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM covid.coviddeaths
WHERE continent IS NOT NULL
ORDER BY 1,2; 

-- Total cases vs Total deaths
-- Showing the likelihood of dying if contracted with covid

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM covid.coviddeaths
WHERE location LIKE '%states%'
AND continent IS NOT NULL 
ORDER BY 1,2; 

-- Total Cases vs Population
-- Shows what percentage of population infected with Covid

SELECT location, date, population, total_cases, (total_cases/population)*100 AS PercentPopulationInfected
FROM covid.coviddeaths
ORDER BY 1,2; 

-- Countries having highest infection rate compared to population

SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM covid.coviddeaths
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC;

-- countries having highest death count per population

SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM covid.coviddeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount DESC; 

-- showing continents with highest death count per population

SELECT continent, MAX(total_deaths) AS TotalDeathCount
FROM covid.coviddeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC; 

-- global numbers








