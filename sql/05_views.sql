CREATE OR REPLACE VIEW vw_bookings_analysis AS
SELECT
  arrival_date,
  hotel,
  market_segment,
  distribution_channel,
  country,
  seasons,
  is_canceled,
  stay_length,
  guest_count,
  adr_num        AS adr,
  total_revenue_num AS total_revenue,
  COALESCE(guest_type, 'other') AS guest_type
FROM bookings_clean;
