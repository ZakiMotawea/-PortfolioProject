use test
select *
from test.dbo.CovidData
------------------------------------------------for first 2 monthes in 2022 for egypt-------------------
with egypt_2_monthes as(
select location,date,new_cases,total_cases,total_deaths,new_deaths,population
from test.dbo.CovidData
where location='egypt' and
date between'2022-01-01' and '2022-03-01'
)
--------the NEW CASES  VS  POPULATION PER DAY
select location, date,round((new_cases/population),7) as infection_percentage
from egypt_2_monthes



----------------the new_cases vs total_cases 
with egypt_2_monthes as(
select location,date,new_cases,total_cases,total_deaths,new_deaths,population
from test.dbo.CovidData
where location='egypt' and
date between'2022-01-01' and '2022-03-01'
)
SELECT date,round((new_cases/total_cases),5) as Newcases_to_Totalcases
from egypt_2_monthes


-------------------- new_death vs total death
with egypt_2_monthes as(
select location,date,new_cases,total_cases,total_deaths,new_deaths,population
from test.dbo.CovidData
where location='egypt' and
date between'2022-01-01' and '2022-03-01'
)
select date, round((new_deaths/new_cases),5) as DeathsRate_Per_Day 
from egypt_2_monthes
where new_cases<>0

---------------------------------- top ten days maximum new cases
with egypt_2_monthes as(
select location,date,new_cases,total_cases,total_deaths,new_deaths,population
from test.dbo.CovidData
where location='egypt' and
date between'2022-01-01' and '2022-03-01'
)
select TOP 10 date, max(NEW_CASES) as maximum_cases
FROM egypt_2_monthes
GROUP BY date
order by max(NEW_CASES) desc

---------------------------------top 10 days with mximum new deaths
with egypt_2_monthes as(
select location,date,new_cases,total_cases,total_deaths,new_deaths,population
from test.dbo.CovidData
where location='egypt' and
date between'2022-01-01' and '2022-03-01'
)
select top 10 date,max(new_deaths) as maximum_deaths
from egypt_2_monthes
group by date
order by max(new_deaths) desc


------------------------------total cases through this months
with egypt_2_monthes as(
select location,date,new_cases,total_cases,total_deaths,new_deaths,population
from test.dbo.CovidData
where location='egypt' and
date between'2022-01-01' and '2022-03-01'
)
select sum(new_cases) as Total_Cases
from egypt_2_monthes






