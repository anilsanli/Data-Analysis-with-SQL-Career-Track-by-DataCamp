--
--Date comparisons
--

-- Count requests created on January 31, 2017
SELECT count(*) 
  FROM evanston311
 WHERE date_created::date = '2017-01-31';
 
-- Count requests created on February 29, 2016
SELECT count(*)
  FROM evanston311 
 WHERE date_created >= '2016-02-29' 
   AND date_created < '2016-03-01';
   
-- Count requests created on March 13, 2017
SELECT count(*)
  FROM evanston311
 WHERE date_created >= '2017-03-13'
   AND date_created < '2017-03-13'::date + '1 day'::interval;
   
--
--Date arithmetic
--

-- Subtract the min date_created from the max
SELECT MAX(date_created) - MIN(date_created)
  FROM evanston311;
  
-- How old is the most recent request?
SELECT now() - MAX(date_created)
  FROM evanston311;
  
-- Add 100 days to the current timestamp
SELECT now() + '100 days'::interval;

-- Select the current timestamp, 
-- and the current timestamp + 5 minutes
SELECT now() + '5 minutes'::interval;

--
--Completion time by category
--

-- Select the category and the average completion time by category
SELECT category, 
       AVG(date_completed - date_created) AS completion_time
  FROM evanston311
 GROUP BY category
-- Order the results
 ORDER BY completion_time DESC;
 
--
--Date parts
--

-- Extract the month from date_created and count requests
SELECT date_part('month', date_created) AS month, 
       count(*)
  FROM evanston311
 -- Limit the date range
 WHERE date_created >= '2016-01-01'
   AND date_created < '2018-01-01'
 -- Group by what to get monthly counts?
 GROUP BY month;
 
-- Get the hour and count requests
SELECT date_part('hour', date_created) AS hour,
       count(*)
  FROM evanston311
 GROUP BY hour
 -- Order results to select most common
 ORDER BY count(*) DESC
 LIMIT 1;
 
-- Count requests completed by hour
SELECT date_part('hour', date_completed) AS hour,
       count(*)
  FROM evanston311
 GROUP BY hour
 ORDER BY hour;

---
