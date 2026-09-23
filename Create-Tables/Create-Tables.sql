


create database SkyTrackAirlinedbs;

use SkyTrackAirlinedbs;


create table AIRPORT(
Airport_Id INT AUTO_INCREMENT PRIMARY KEY   ,
 IATA_Code CHAR(3) NOT NULL UNIQUE,
 Name VARCHAR(50) NOT NULL,
 City VARCHAR(50) NOT NULL,
 Country VARCHAR(50) NOT NULL
);


CREATE TABLE AIRCRAFT (
    Aircraft_Id INT AUTO_INCREMENT PRIMARY KEY,
    Registration_Number VARCHAR(20) NOT NULL UNIQUE,
    Manufacturer VARCHAR(50) NOT NULL,
    Total_Seating_Capacity INT NOT NULL check (Total_Seating_Capacity > 0),
    Year_of_Manufacture INT NOT NULL
);



CREATE TABLE FLIGHT(
    Flight_id INT auto_increment PRIMARY KEY,
    Flight_number VARCHAR(20)  NOT NULL UNIQUE,
    DepartureDateTime DATETIME NOT NULL,
    ArrivalDateTime DATETIME NOT NULL,
    Status varchar(50) NOT NULL default 'Scheduled' CHECK (Status IN ('Scheduled','Delayed','Cancelled','Completed')),
	Aircraft_Registeration_Number INT,
    Departing_Airport_code INT NOT NULL,
    Arriving_Airport_code INT NOT NULL,
    
    constraint FK_Aircraft_Registeration_Number
    foreign key (Aircraft_Registeration_Number) references AIRCRAFT(Aircraft_Id)
    ON delete cascade
    ON update cascade,
    
    constraint FK_Departing_Airport_code
    foreign key (Departing_Airport_code) references  AIRPORT(Airport_Id)
    ON delete cascade
    ON update cascade,
    
    
     constraint FK_Arriving_Airport_code
    foreign key (Arriving_Airport_code) references  AIRPORT(Airport_Id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    
     constraint CHK_FLIGHT_DATES CHECK (ArrivalDateTime > DepartureDateTime)

);





CREATE TABLE PASSENGER (
    Passenger_Id INT AUTO_INCREMENT PRIMARY KEY,
    National_ID VARCHAR(20) NOT NULL UNIQUE,
    Fname VARCHAR(50) NOT NULL,
    Mname VARCHAR(50) NULL,
    Lname VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20) NULL,
    Nationality VARCHAR(50) NOT NULL,
    Date_of_Birth DATE NOT NULL
);


CREATE TABLE BOOKING(
Booking_Id INT auto_increment primary KEY,
Passenger_id INT NOT NULL,
Flight_id INT NOT NULL,
seat_number VARCHAR(50) NOT NULL,
class varchar(50) NOT NULL default "Economy" CHECK (class IN('Economy', 'Business', 'First')),
Price_Paid decimal(10,2) not Null CHECK (Price_Paid > 0),
Booking_Date DATE NOT NULL DEFAULT (CURDATE()),



constraint FK_Passenger_id 
foreign key (Passenger_id) references PASSENGER(Passenger_id)
ON delete cascade
ON update cascade,


constraint FK_Flight_id
foreign key (Flight_id) references FLIGHT(Flight_id)
ON delete cascade
ON update cascade

);

CREATE TABLE CREW_MEMBER (
   Crew_id INT AUTO_INCREMENT PRIMARY KEY,
    License_number VARCHAR(20) NOT NULL UNIQUE,
    Fname VARCHAR(50) NOT NULL,
    Mname VARCHAR(50) NULL,
    Lname VARCHAR(50) NOT NULL,
    role varchar(100) NOT NULL CHECK  ( role IN ('Pilot','Co-Pilot','Flight Attendant','Engineer'))

);


CREATE TABLE FLIGHT_CREW(
Flight_Crew_id INT AUTO_INCREMENT PRIMARY KEY,
Crew_id INT NOT NULL,
Flight_id INT NOT NULL,


constraint FK_FlightCrew_Crew
foreign key (Crew_id) references CREW_MEMBER(Crew_id)
 ON DELETE CASCADE
 ON UPDATE CASCADE,

   CONSTRAINT FK_FlightCrew_Flight
        FOREIGN KEY (Flight_id) REFERENCES Flight(Flight_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
        
        constraint UQ_FLIGHTCREW unique (Crew_id, Flight_id)

);











