-- Find mismatches (codes in bookings_data_raw not found in country_dim)
SELECT DISTINCT b.country
from bookings_data_raw b
left join country_dim c
	on b.country = c.country
WHERE c.country IS NULL
order by b.country;


-- Joining tables
DROP TABLE IF EXISTS booking_joined;

CREATE TABLE booking_joined AS
SELECT
  b.*,
  c.country_full_name,
  c.region
FROM bookings_data_raw AS b
LEFT JOIN country_dim AS c
  ON b.country = c.country;

