-- Checking data loading
SELECT COUNT(*) AS total_rows FROM bookings_data_raw;
SELECT * FROM bookings_data_raw LIMIT 10;


-- Checking NUlls and Missing values
SELECT
    SUM(CASE WHEN country IS NULL OR country = '' THEN 1 ELSE 0 END) AS missing_country,
    SUM(CASE WHEN children IS NULL THEN 1 ELSE 0 END) AS missing_children,
    SUM(CASE WHEN agent IS NULL THEN 1 ELSE 0 END) AS missing_agent
FROM bookings_data_raw;


-- How many rows have 0 guests?
SELECT COUNT(*) AS no_guest_rows
FROM bookings_data_raw
WHERE (adults + COALESCE(children,0) + babies) = 0;
-- 180 records for

-- Delete them
DELETE FROM bookings_data_raw
WHERE (adults + COALESCE(children,0) + babies) = 0;


-- country details
SELECT DISTINCT country
FROM bookings_data_raw
ORDER BY country;

-- there is NULL as string - confirming the issue
SELECT
  SUM( (country IS NULL)::int )                      AS real_nulls,
  SUM( (trim(country) = '')::int )                   AS blanks,
  SUM( (upper(trim(country)) = 'NULL')::int )        AS string_NULLs
FROM bookings_data_raw;

-- Replace real NULL, blanks, and the string 'NULL' with 'Unknown'
UPDATE bookings_data_raw
SET country = 'Unknown'
WHERE country IS NULL
   OR trim(country) = ''
   OR upper(trim(country)) = 'NULL';





-- Quick business checks
SELECT
  SUM( (agent   IS NULL OR agent   = '')::int ) AS maybe_booked_direct,
  SUM( (company IS NULL OR company = '')::int ) AS maybe_individual_guest
FROM bookings_data_raw;

-- Cancellation rate
SELECT ROUND(AVG(is_canceled::numeric)*100,2) AS cancel_rate_pct
FROM bookings_data_raw;

-- ADR by guest type (joined table)
SELECT
  guest_type,
  ROUND(AVG(adr::numeric), 2) AS avg_adr
FROM bookings_data_raw
GROUP BY guest_type
ORDER BY avg_adr DESC;


