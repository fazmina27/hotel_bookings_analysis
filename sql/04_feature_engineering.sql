-- stay_length, guest_count, booking_status are simple and safe
ALTER TABLE bookings_data_raw
  ADD COLUMN stay_length int
    GENERATED ALWAYS AS (stays_in_weekend_nights + stays_in_week_nights) STORED;

ALTER TABLE bookings_data_raw
  ADD COLUMN guest_count int
    GENERATED ALWAYS AS (adults + COALESCE(children,0) + babies) STORED;

ALTER TABLE bookings_data_raw
  ADD COLUMN booking_status varchar(25)
    GENERATED ALWAYS AS (CASE WHEN is_canceled = 1 THEN 'Canceled' ELSE 'Booked' END) STORED;

-- arrival_date: build a date from year + month name + day, then subtract lead_time
-- Use FMMonth to parse full month names without padding (Jan/January) and keep it immutable
ALTER TABLE bookings_data_raw
  ADD COLUMN arrival_date date
    GENERATED ALWAYS AS (
      (
        make_date(
          arrival_date_year,
          CASE upper(arrival_date_month)
            WHEN 'JANUARY'   THEN 1
            WHEN 'FEBRUARY'  THEN 2
            WHEN 'MARCH'     THEN 3
            WHEN 'APRIL'     THEN 4
            WHEN 'MAY'       THEN 5
            WHEN 'JUNE'      THEN 6
            WHEN 'JULY'      THEN 7
            WHEN 'AUGUST'    THEN 8
            WHEN 'SEPTEMBER' THEN 9
            WHEN 'OCTOBER'   THEN 10
            WHEN 'NOVEMBER'  THEN 11
            WHEN 'DECEMBER'  THEN 12
          END,
          arrival_date_day_of_month
        ) - lead_time
      )::date
    ) STORED;

-- seasons from month name (case-insensitive)
ALTER TABLE bookings_data_raw
  ADD COLUMN seasons varchar(25)
    GENERATED ALWAYS AS (
      CASE
        WHEN upper(arrival_date_month) IN ('DECEMBER','JANUARY','FEBRUARY')          THEN 'Winter'
        WHEN upper(arrival_date_month) IN ('MARCH','APRIL','MAY')                    THEN 'Summer'
        WHEN upper(arrival_date_month) IN ('JUNE','JULY','AUGUST','SEPTEMBER')       THEN 'Monsoon'
        WHEN upper(arrival_date_month) IN ('OCTOBER','NOVEMBER')                     THEN 'Autumn'
        ELSE NULL
      END
    ) STORED;

-- revenue = ADR * stay_length
ALTER TABLE bookings_data_raw
  ADD COLUMN total_revenue numeric(14,2)
    GENERATED ALWAYS AS ((COALESCE(adr,0)::numeric * COALESCE(stay_length,0))::numeric(14,2)) STORED;


-- Guest-type categorization
ALTER TABLE bookings_data_raw ADD COLUMN guest_type varchar(20);

UPDATE bookings_data_raw
SET guest_type =
  CASE
    WHEN adults = 1 AND COALESCE(children,0) = 0 AND babies = 0 THEN 'single'
    WHEN adults >= 1 AND (COALESCE(children,0) > 0 OR babies > 0) THEN 'family'
    WHEN adults = 2 AND COALESCE(children,0) = 0 AND babies = 0 THEN 'couple'
    WHEN adults > 2 AND COALESCE(children,0) = 0 AND babies = 0 THEN 'group'
    WHEN adults = 0 AND COALESCE(children,0) > 0 AND babies = 0 THEN 'youth'
    ELSE 'other'
  END;


DROP TABLE IF EXISTS bookings_clean;
CREATE TABLE bookings_clean AS
SELECT
  *,
  -- ensure money-like fields are numeric
  (adr::numeric)                           AS adr_num,
  (total_revenue::numeric)                 AS total_revenue_num
FROM booking_joined;


