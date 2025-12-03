-- Run core analytical SQl

-- KPI pack
-- Row count, cancellation rate, avg ADR
SELECT
  COUNT(*)                                        AS total_rows,
  ROUND(AVG(is_canceled::numeric)*100, 2)         AS cancel_rate_pct,
  ROUND(AVG(adr_num), 2)                          AS avg_adr
FROM bookings_clean;


-- ADR by hotel & Season
SELECT
  hotel,
  seasons,
  ROUND(AVG(adr_num), 2) AS avg_adr
FROM bookings_clean
GROUP BY hotel, seasons
ORDER BY hotel, avg_adr DESC;


-- Cancellation by Market Segment
SELECT
  market_segment,
  ROUND(AVG(is_canceled::numeric)*100, 2) AS cancel_rate_pct,
  COUNT(*)                                AS bookings
FROM bookings_clean
GROUP BY market_segment
ORDER BY cancel_rate_pct DESC;


-- Top 10 countries by bookings
SELECT
  COALESCE(country_full_name, 'Unknown') AS country_full_name,
  COUNT(*)                     AS bookings
FROM bookings_clean
GROUP BY country_full_name
ORDER BY bookings DESC
LIMIT 10;


-- ADR vs Stay length
WITH b AS (
  SELECT
    CASE
      WHEN stay_length <= 2 THEN '1-2'
      WHEN stay_length <= 5 THEN '3-5'
      WHEN stay_length <= 7 THEN '6-7'
      WHEN stay_length <= 14 THEN '8-14'
      ELSE '15+'
    END AS stay_bucket,
    adr_num,
    is_canceled
  FROM bookings_clean
)
SELECT
  stay_bucket,
  ROUND(AVG(adr_num),2)                         AS avg_adr,
  ROUND(AVG(is_canceled::numeric)*100,2)        AS cancel_rate_pct,
  COUNT(*)                                      AS bookings
FROM b
GROUP BY stay_bucket
ORDER BY bookings DESC;


















