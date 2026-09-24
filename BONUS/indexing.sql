



/*
  Tabel:booking
  column: Flight_id
   benefits : show each flight with total passanger,
   total revenue > 500,
   Flight with highest bookings
*/

CREATE INDEX Idx_booking_flight on booking(Flight_id);

/*
  Tabel:FLIGHT
  column: Departing_Airport_code, Arriving_Airport_code
   benefits : Show each flight with origin and destination,
   Show complete flight summary with origin and destination
   
*/
CREATE INDEX idx_arriving_departing
ON FLIGHT(Departing_Airport_code, Arriving_Airport_code);

CREATE INDEX idx_flight_status ON FLIGHT(Status);
CREATE INDEX idx_flightcrew_flight_crew ON FLIGHT_CREW(Flight_Id, Crew_Id);

