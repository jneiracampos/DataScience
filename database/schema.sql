CREATE TABLE IF NOT EXISTS airlines (
    "airline_name" TEXT,
    "founded" INT,
    "destinations_served" INT,
    "fleet_size" INT,
    "iata" TEXT,
    "icao" TEXT,
    "callsign" TEXT,
    "is_active" BOOLEAN,
    "annual_revenue" NUMERIC(3, 1),
    "number_of_employees" INT,
    "number_of_planes" INT,
    "headquart_city" TEXT,
    "headquart_state" TEXT,
    "airline_id" INT primary key
);

CREATE TABLE IF NOT EXISTS airplanes (
    "date_completed" TEXT,
    "Manufacturer" TEXT,
    "ICAO_Code" TEXT,
    "Model" TEXT,
    "physical_class" TEXT,
    "number_of_engines" NUMERIC(2, 1),
    "Approach_Speed" INT,
    "Wingspan" NUMERIC(5, 2),
    "Wingtip_Configuration" TEXT,
    "Length" NUMERIC(5, 2),
    "Tail_Height" NUMERIC(17, 15),
    "Wheelbase" NUMERIC(17, 14),
    "Cockpit_to_Main_Gear" NUMERIC(18, 15),
    "MGW" NUMERIC(16, 14),
    "MTOW" NUMERIC(4, 1),
    "Max_Ramp" NUMERIC(4, 1),
    "Main_Gear_Config" TEXT,
    "Wake_Category" TEXT,
    "ATCT_Weight_Class" TEXT,
    "name" TEXT,
    "airplane_id" INT primary key
);

CREATE TABLE IF NOT EXISTS airports (
    "airport_id" INT primary key,
    "Name" TEXT,
    "City" TEXT,
    "Country" TEXT,
    "IATA" TEXT,
    "ICAO" TEXT,
    "Latitude" NUMERIC(11, 9),
    "Longitude" NUMERIC(12, 9),
    "Altitude" INT,
    "Timezone" NUMERIC(4, 2),
    "DST" TEXT,
    "Tz_database_time_zone" TEXT,
    "Type" TEXT
);

CREATE TABLE IF NOT EXISTS booking_info (
    "fareBasisCode" TEXT,
    "isBasicEconomy" BOOLEAN,
    "isRefundable" BOOLEAN,
    "isNonStop" BOOLEAN,
    "seatsRemaining" INT,
    "booking_id" INT primary key,
    "search_year" INT,
    "search_month" INT,
    "search_day" INT
);

CREATE TABLE IF NOT EXISTS flight_info (
    "elapsed_days" INT,
    "departure_time_unix" INT,
    "arrival_time_unix" INT,
    "duration_in_seconds" INT,
    "total_distance" INT,
    "duration_hours" INT,
    "duration_minutes" INT,
    "departure_year" INT,
    "departure_month" INT,
    "departure_day" INT,
    "departure_hour" INT,
    "departure_minute" INT,
    "departure_second" INT,
    "departure_timezone" NUMERIC(4, 2),
    "arrival_year" INT,
    "arrival_month" INT,
    "arrival_day" INT,
    "arrival_hour" INT,
    "arrival_minute" INT,
    "arrival_second" INT,
    "arrival_timezone" NUMERIC(4, 2),
    "flight_id" INT primary key
);

CREATE TABLE IF NOT EXISTS fact_table (
    "totalFare" NUMERIC(7, 2),
    "arrival_airport_id" INT,
    "departure_airport_id" INT,
    "airline_id" INT, 
    "airplane_id" INT,
    "book_info_id" INT,
    "flight_info_id" INT,
    CONSTRAINT fk_arrival_airport FOREIGN KEY (arrival_airport_id) REFERENCES airports(airport_id),
    CONSTRAINT fk_departure_airport FOREIGN KEY (departure_airport_id) REFERENCES airports(airport_id),
    CONSTRAINT fk_airline FOREIGN KEY (airline_id) REFERENCES airlines(airline_id),
    CONSTRAINT fk_airplane FOREIGN KEY (airplane_id) REFERENCES airplanes(airplane_id),
    CONSTRAINT fk_book_info FOREIGN KEY (book_info_id) REFERENCES booking_info(booking_id),
    CONSTRAINT fk_flight_info FOREIGN KEY (flight_info_id) REFERENCES flight_info(flight_id),
    PRIMARY KEY(arrival_airport_id, departure_airport_id, airline_id, airplane_id, book_info_id, flight_info_id)

);