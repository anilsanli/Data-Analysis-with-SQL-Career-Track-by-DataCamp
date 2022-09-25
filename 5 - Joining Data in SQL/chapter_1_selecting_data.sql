--
--Practice with COUNT()
--

-- Count the number of records in the people table
SELECT COUNT(*) AS count_records FROM people;

-- Count the number of birthdates in the people table
SELECT COUNT(birthdate) AS count_birthdate FROM people;

-- Count the languages and countries represented in the films table
SELECT COUNT(language) AS count_languages, COUNT(country) AS count_countries FROM films;

--
--SELECT DISTINCT
--

-- Return the unique countries from the films table
SELECT DISTINCT country FROM films;

-- Count the distinct countries from the films table
SELECT COUNT(DISTINCT country) AS count_distinct_countries FROM films;

--
--Debugging errors
--

-- Debug this code
SELECT certification
FROM films
LIMIT 5;

-- Debug this code
SELECT film_id, imdb_score, num_votes
FROM reviews;

-- Debug this code
SELECT COUNT(birthdate) AS count_birthdays
FROM people;

--
--Formatting
--

-- Rewrite this query
SELECT person_id, role
FROM roles 
LIMIT 10;

