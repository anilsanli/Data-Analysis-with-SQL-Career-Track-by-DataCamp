--
--Comparing global economies
--

--Select all fields from economies2015
SELECT *
FROM economies2015
-- Set operation
UNION
-- Select all fields from economies2019
SELECT *
FROM economies2019
ORDER BY code, year;

--
--Comparing two set operations
--

--Query that determines all pairs of code and year from economies and populations, without duplicates
SELECT code, year
FROM economies
UNION
SELECT country_code, size
FROM populations
ORDER BY code, year;

SELECT code, year
FROM economies
--Set theory clause
UNION ALL
SELECT country_code, year
FROM populations
ORDER BY code, year;

--
--Intersect
--

-- Return all cities with the same name as a country
SELECT name
FROM cities
INTERSECT
SELECT name
FROM countries;

--
--You've got it, EXCEPT...
--

-- Return all cities that do not have the same name as a country
SELECT name FROM cities
EXCEPT
SELECT name FROM countries
ORDER BY name;