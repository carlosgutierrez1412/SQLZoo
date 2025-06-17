-- 6. List the Company name and the number of calls for those companies with more than 18 calls.
WITH companies_cte AS (

SELECT company_name, caller_id
FROM Customer c
JOIN Caller ca
ON c.company_ref = ca.company_ref

)

SELECT company_name, COUNT(*) AS cc
FROM companies_cte cte
JOIN Issue i
ON cte.caller_id = i.caller_id
GROUP BY company_name
HAVING cc > 18

-- OR
SELECT company_name, COUNT(*) AS cc
FROM Customer c
JOIN Caller ca ON c.company_ref = ca.company_ref
JOIN Issue i ON ca.caller_id = i.caller_id
GROUP BY company_name
HAVING cc > 18

-- 7. Find the callers who have never made a call. Show first name and last name
SELECT first_name,
last_name
FROM Caller ca
LEFT JOIN Issue i
ON ca.caller_id = i.caller_id
WHERE call_date IS NULL

-- 8. For each customer show: Company name, contact name, number of calls where the number of calls is fewer than 5
WITH call_counts AS (
    SELECT 
        cu.company_name,
        cu.contact_id,
        COUNT(*) AS nc
    FROM Customer cu
    JOIN Caller ca ON cu.company_ref = ca.company_ref
    JOIN Issue i ON ca.caller_id = i.caller_id
    GROUP BY cu.company_name, cu.contact_id
    HAVING COUNT(*) < 5
)

SELECT 
    cc.company_name,
    ca.first_name,
    ca.last_name,
    cc.nc
FROM call_counts cc
JOIN Caller ca ON cc.contact_id = ca.caller_id
ORDER BY cc.nc DESC, ca.first_name;
