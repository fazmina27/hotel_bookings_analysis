-- Create the table for booking_details
CREATE TABLE bookings_data_raw (
    Booking_ID INT PRIMARY KEY,
    hotel VARCHAR(100),
    is_canceled INT,
    lead_time INT,
    arrival_date_year INT,
    arrival_date_month VARCHAR(20),
    arrival_date_week_number INT,
    arrival_date_day_of_month INT,
    stays_in_weekend_nights INT,
    stays_in_week_nights INT,
    adults INT,
    children FLOAT,
    babies INT,
    meal VARCHAR(50),
    country VARCHAR(10),
    market_segment VARCHAR(50),
    distribution_channel VARCHAR(50),
    is_repeated_guest INT,
    previous_cancellations INT,
    previous_bookings_not_canceled INT,
    reserved_room_type VARCHAR(10),
    assigned_room_type VARCHAR(10),
    booking_changes INT,
    deposit_type VARCHAR(50),
    agent VARCHAR(10),
    company VARCHAR(10),
    days_in_waiting_list INT,
    customer_type VARCHAR(50),
    adr FLOAT,
    required_car_parking_spaces INT,
    total_of_special_requests INT,
    reservation_status VARCHAR(50),
    reservation_status_date DATE
);


-- Creating country lockup table
Create Table country_dim (
	country VARCHAR(10),
	country_full_name VARCHAR(50),
	region VARCHAR(50)
);
