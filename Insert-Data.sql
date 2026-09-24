

use SkyTrackAirlinedbs;

INSERT INTO AIRPORT (IATA_Code, Name, City, Country) VALUES
('MCT', 'Muscat International Airport', 'Muscat', 'Oman'),
('DXB', 'Dubai International Airport', 'Dubai', 'UAE'),
('RUH', 'King Khalid International Airport', 'Riyadh', 'Saudi Arabia'),
('KWI', 'Kuwait International Airport', 'Kuwait City', 'Kuwait'),
('SLL', 'Salalah International Airport', 'Salalah', 'Oman'),
('DOH', 'Hamad International Airport', 'Doha', 'Qatar'),
('CAI', 'Cairo International Airport', 'Cairo', 'Egypt');

select * from AIRPORT;


INSERT INTO AIRCRAFT (Registration_Number, Manufacturer, Model, Total_Seating_Capacity, Year_of_Manufacture) VALUES
('A6-EAA', 'Boeing', '737-800', 350, 2025),
('A6-EAB', 'Airbus', 'A320neo', 280, 2026),
('N12345', 'Boeing', '787-9', 180, 2026),
('G-ABCD', 'Airbus', 'A350-900', 220, 2025),
('VP-BAA', 'Embraer', 'E190', 120, 2026);

select * FROM aircraft;

INSERT INTO FLIGHT 
(Flight_Number, DepartureDateTime, ArrivalDateTime, Status, Aircraft_Registeration_Number, Departing_Airport_code, Arriving_Airport_code) 
VALUES
('WY101', '2026-10-01 08:00:00', '2026-10-01 10:30:00', 'Scheduled', 1, 1, 2),
('WY102', '2026-10-01 12:00:00', '2026-10-01 14:30:00', 'Scheduled', 2, 1, 3),
('WY103', '2026-10-01 15:00:00', '2026-10-01 17:30:00', 'Delayed', 3, 2, 4),
('EK201', '2026-10-02 09:00:00', '2026-10-02 11:00:00', 'Delayed', 4, 2, 5),
('QR301', '2026-10-02 14:00:00', '2026-10-02 16:00:00', 'Cancelled', 5, 3, 6),
('SV401', '2026-10-03 10:00:00', '2026-10-03 12:30:00', 'Cancelled', 1, 4, 7),
('MS501', '2026-09-25 07:00:00', '2026-09-25 09:30:00', 'Completed', 2, 5, 1),
('WY104', '2026-09-26 13:00:00', '2026-09-26 15:30:00', 'Completed', 3, 6, 2);


INSERT INTO PASSENGER (National_ID, Fname, Mname, Lname, Email, Phone, Nationality, Date_of_Birth) VALUES
('OM12345678', 'Ahmed', 'Salem', 'Al-Balushi', 'ahmed@example.com', '+96891234567', 'Oman', '1990-05-15'),
('AE98765432', 'Fatima', 'Ali', 'Al-Mansoori', 'fatima@example.com', '+971501234567', 'UAE', '1985-08-22'),
('SA11223344', 'Omar', 'Khalid', 'Al-Otaibi', 'omar@example.com', '+966501234567', 'Saudi Arabia', '1992-03-10'),
('KW55667788', 'Noura', 'Fahad', 'Al-Sabah', 'noura@example.com', '+96551234567', 'Kuwait', '1995-11-30'),
('QA99887766', 'Khalid', 'Hamad', 'Al-Thani', 'khalid@example.com', '+97433123456', 'Qatar', '1988-07-18'),
('EG44556677', 'Mona', 'Hassan', 'Ibrahim', 'mona@example.com', '+201012345678', 'Egypt', '1993-01-25'),
('IN33445566', 'Raj', 'Kumar', 'Sharma', 'raj@example.com', '+919812345678', 'India', '1991-09-05'),
('GB22334455', 'John', 'David', 'Smith', 'john@example.com', '+447912345678', 'UK', '1987-12-12');

INSERT INTO BOOKING (Passenger_id, Flight_id, seat_number, class, Price_Paid, Booking_Date) VALUES
(1, 17, '1A', 'First', 500.00, '2026-09-20'),
(2, 18, '1B', 'First', 500.00, '2026-09-20'),
(3, 19, '10A', 'Economy', 150.00, '2026-09-21'),
(4, 20, '2A', 'Business', 300.00, '2026-09-21'),
(5, 21, '2B', 'Business', 300.00, '2026-09-22'),
(6, 22, '15C', 'Economy', 120.00, '2026-09-22'),
(7, 23, '3A', 'Business', 350.00, '2026-09-23'),
(8, 24, '20D', 'Economy', 100.00, '2026-09-23'),
(1, 20, '5A', 'First', 450.00, '2026-09-24'),
(2, 19, '12B', 'Economy', 130.00, '2026-09-24');



INSERT INTO CREW_MEMBER (License_Number, Fname, Mname, Lname, Role) VALUES
('PIL-001', 'Salem', 'Ahmed', 'Al-Harthy', 'Pilot'),
('PIL-002', 'Hamad', 'Rashid', 'Al-Mazrouei', 'Pilot'),
('COP-001', 'Yousef', 'Ali', 'Al-Habsi', 'Co-Pilot'),
('COP-002', 'Saif', 'Nasser', 'Al-Kindi', 'Co-Pilot'),
('ATT-001', 'Maryam', 'Salim', 'Al-Riyami', 'Flight Attendant'),
('ATT-002', 'Aisha', 'Khalid', 'Al-Zadjali', 'Flight Attendant'),
('ENG-001', 'Tariq', 'Hassan', 'Al-Lawati', 'Engineer'),
('ENG-002', 'Nabil', 'Omar', 'Al-Farsi', 'Engineer');

SELECT * FROM CREW_MEMBER;



INSERT INTO FLIGHT_CREW (Crew_Id, Flight_Id) VALUES
(1, 19),
(3, 19),
(5, 19),
(2, 17),
(4, 17),
(6, 17),
(1, 20),
(5, 20),      
(2, 21),
(6, 21),
(7, 21),
(1, 21),
(5, 21),   
(2, 18),
(4, 18),
(6, 18),
(8, 18),
(1, 18);














