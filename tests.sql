--Testy wizualizacji
select l.ContinentName, SUM(NumberOfCases) as total_cases, 
SUM(NumberOfDeaths) as total_deaths,
SUM(NumberOfTests) as total_tests from FactCovidCases c
join DimLocation l on l.LocationKey=c.LocationKey
group by l.ContinentName
order by total_cases desc

select Year(CAST(CAST(c.DateKey as varchar(8)) as date)) as comparsion_year, 
SUM(c.NumberOfDeaths) as total_deaths, 
ROUND(AVG(v.PercentOfFullyVaccinated), 2) as average_percent_of_fully_vaccinated from FactCovidCases c
join DimDate d on d.DateKey=c.DateKey
join FactCovidVaccinations v on v.DateKey=d.DateKey
group by Year(CAST(CAST(c.DateKey as varchar(8)) as date))
order by comparsion_year


--Testy ETL
select * from FactCovidCases
where DateKey=20240107 and LocationKey=127

select SUM(NumberOfCases) from FactCovidCases f
join DimLocation l on f.LocationKey=l.LocationKey
where l.CountryName='Poland' and f.DateKey>=20230301 and f.DateKey<= 20230401
group by f.LocationKey
