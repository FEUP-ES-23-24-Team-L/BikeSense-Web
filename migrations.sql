CREATE TABLE IF NOT EXISTS sensor_units (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid()
);

CREATE TABLE IF NOT EXISTS bikes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid()
);

CREATE TABLE IF NOT EXISTS trip (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  bike_id uuid REFERENCES bikes(id) NOT NULL,
  sensor_unit_id uuid REFERENCES sensor_units(id) NOT NULL,
  date date NOT NULL,
  time timestamp NOT NULL,
  duration interval NOT NULL,
  travel_distance float NOT NULL
);

CREATE TABLE IF NOT EXISTS sensor_data (
  id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  trip_id uuid REFERENCES trip(id) NOT NULL,
  timestamp timestamp,
  gps_point varchar(100),
  noise float,
  temperature float,
  humidity float,
  uv float,
  luminosity float,
  carbon_monoxide float,
  polution float
);
