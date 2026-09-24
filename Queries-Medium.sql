/********************************************/

use SkyTrackAirlinedbs;

select Flight_number,a.Name as DepartingAirport , b.Name as Arriving_Airport   from flight f
 inner join airport a on f.Departing_Airport_code = a.Airport_Id
 inner join airport b on f.Arriving_Airport_code = b.Airport_Id;
 
 
 
 select CONCAT(Fname,' ',Mname,' ', Lname) as FullName, Flight_number from booking b
 inner join passenger p on b.Passenger_id = p.Passenger_Id
 inner join flight f on b.Flight_id = f.Flight_id;
 
 
 
 select CONCAT(Fname,' ',Mname,' ', Lname) as FullName , role from crew_member c 
 inner join flight_crew fc on c.Crew_id = fc.Crew_id 
 inner join flight f on f.Flight_id = fc.Flight_id
 where f.Flight_number='WY101';
 
 
 
 
 
 select Flight_number,Status,Model from flight f
 inner join aircraft a on a.Aircraft_Id = f.Aircraft_Registeration_Number
 WHERE f.Status = 'Completed';
 
 select CONCAT(Fname,' ',Mname,' ', Lname) as FullName ,count(Booking_Id) as Totals_Booking
 from passenger p 
 inner join booking b on p.Passenger_Id = b.Passenger_Id
 group by p.Passenger_Id, p.Fname, p.Mname, p.Lname
 order by  Totals_Booking desc;
 
 select Booking_Class,Count(Price_Paid) as Total_revenue 
 from booking b
 group by  Booking_Class;
 

SELECT a.Registration_Number, a.Model,
    COUNT(f.Flight_Id) AS Total_Flights
FROM AIRCRAFT a
LEFT JOIN FLIGHT f ON a.Aircraft_Id = f.Aircraft_Registeration_Number
GROUP BY a.Aircraft_Id, a.Registration_Number, a.Model;


 
 SELECT f.Flight_Number,COUNT(b.Booking_Id) AS Total_Bookings
FROM FLIGHT f
INNER JOIN BOOKING b ON f.Flight_Id = b.Flight_Id
GROUP BY f.Flight_Id, f.Flight_Number
HAVING COUNT(b.Booking_Id) > 1; 
 
 
 SELECT CONCAT(' ', p.Fname, p.Mname, p.Lname) AS Passenger_Name,f.Flight_Number,
    dep.Name AS Origin_Airport,
    arr.Name AS Destination_Airport,
    b.Booking_Class,
    b.Price_Paid
FROM BOOKING b
INNER JOIN PASSENGER p ON b.Passenger_Id = p.Passenger_Id
INNER JOIN FLIGHT f ON b.Flight_Id = f.Flight_Id
INNER JOIN AIRPORT dep ON f.Departing_Airport_code = dep.Airport_Id
INNER JOIN AIRPORT arr ON f.Arriving_Airport_code = arr.Airport_Id
ORDER BY b.Booking_Id;
 
 
 
 
 
 
 
 
 
 
 