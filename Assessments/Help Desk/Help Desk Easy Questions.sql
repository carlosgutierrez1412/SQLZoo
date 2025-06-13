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

-- 4. Calls are not normally assigned to a manager but it does happen. How many calls have been assigned to staff who are at Manager Level?
WITH level_cte AS (
    SELECT level_code
    FROM Level
    WHERE Manager = 'Y'
),
manager_cte AS (
    SELECT staff_code
    FROM Staff
    WHERE level_code IN (SELECT level_code FROM level_cte)
)

SELECT COUNT(*) AS mlcc
FROM manager_cte st
JOIN Issue i
  ON st.staff_code = i.assigned_to

-- 5. Show the manager for each shift. Your output should include the shift date and type; also the first and last name of the manager.
SELECT Shift_date, Shift_type, first_name, last_name
FROM Shift sh
JOIN Staff st
ON sh.manager = st.staff_code
ORDER BY Shift_date 


