-- 1. There are three issues that include the words "index" and "Oracle". Find the call_date for each of them
SELECT call_date,
call_ref
FROM Issue
WHERE detail LIKE '%index%' AND
detail LIKE '%Oracle%'

-- 2. Samantha Hall made three calls on 2017-08-14. Show the date and time for each
SELECT call_date,
first_name, last_name
FROM Caller ca
JOIN Issue i
ON ca.caller_id = i.caller_id
WHERE first_name = 'Samantha' AND last_name = 'Hall'
ORDER BY call_date
LIMIT 3

-- 3. There are 500 calls in the system (roughly). Write a query that shows the number that have each status.
SELECT status,
COUNT(*) AS volume
FROM Issue
GROUP BY status

