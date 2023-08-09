Select * from CovidDeath.Coviddeaths
order by 3,4;
-- Total cases vs Total Deaths
Select Location,date ,total_cases , new_cases , population 
from CovidDeath.CovidDeaths
order by 1,2;


-- Percentage of Death
Select Location, date ,total_cases , total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from CovidDeath.CovidDeaths
where Location = 'United States'
order by 1,2;

-- Country with highest case rate
Select Location , Population , MAX(total_cases) as HighestinfectionCount , MAX(total_cases/population)*100 as PercentofPOPinfected
From CovidDeath.CovidDeaths
Group by Location, Population
order by PercentofPOPinfected desc;
-- Percenntage of Population got covid in countries ending with STAN
Select Location, date ,total_cases ,Population, (total_cases/population)*100 as InfectionRate
from CovidDeath.CovidDeaths
where location like '%stan%'
order by 1,2;

-- Max death rate
Select Location , MAX(total_deaths) as TotalDeathCount
From CovidDeath.CovidDeaths
where continent is null AND location!= ('High income','Europe')
Group by Location
order by TotalDeathCount desc;

-- Max death rate by continent 
Select continent  , MAX(total_deaths) as TotalDeathCount
From CovidDeath.CovidDeaths
where continent is not null 
Group by continent
order by TotalDeathCount desc;


-- Global death percentage

Select sum(new_cases) as TotalCases,sum(new_deaths) as TotalDeaths,(sum(new_deaths)/sum(new_cases))*100 as DeathPercentage
from CovidDeath.CovidDeaths
order by 1,2;

-- Looking at Total Population and vaccination 
Select death.continent, death.location, death.date, death.population, vac.new_vaccinations
from CovidDeath.CovidDeaths as death 
join CovidVaccine.covidvaccination as vac
on death.location = vac.location
order by 2,3;

-- temp table 
create table #PercentPopulationVaccinated
(continent nvarchar(255),
location nvarchar(255),
Da;

-- create view to store data for later visualixations

create view DeathRatebyContinent as
Select continent  , MAX(total_deaths) as TotalDeathCount
From CovidDeath.CovidDeaths
where continent is not null 
Group by continent
order by TotalDeathCount desc;


-- recall view
select * 
from deathratebycontinent;
-- uce cte

with POPvsVac