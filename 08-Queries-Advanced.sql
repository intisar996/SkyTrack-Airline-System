

SELECT f.Flight_Number,dep.Name AS origin_airport, arv.Name AS Destination_Airport,a.Model,
COUNT(b.Booking_Id) AS Total_Passanger
FROM FLIGHT f
INNER JOIN AIRPORT dep ON f.Departing_Airport_code = dep.Airport_Id
INNER JOIN AIRPORT arv ON f.Arriving_Airport_code = arv.Airport_Id
INNER JOIN AIRCRAFT a ON f.Aircraft_Registeration_Number = a.Aircraft_Id
LEFT JOIN BOOKING b ON f.Flight_Id = b.Flight_Id
GROUP BY f.Flight_Id, f.Flight_Number, dep.Name, arv.Name, a.Model;


SELECT CONCAT(' ', p.Fname, p.Mname, p.Lname) AS FullName,p.National_ID,
p.Email
FROM PASSENGER p
LEFT JOIN BOOKING b ON p.Passenger_Id = b.Passenger_Id
WHERE b.Booking_Id IS NULL;

SELECT f.Flight_Number, SUM(b.Price_Paid) AS Total_Revenue
FROM FLIGHT f
INNER JOIN BOOKING b ON f.Flight_Id = b.Flight_Id
GROUP BY f.Flight_Id, f.Flight_Number
HAVING SUM(b.Price_Paid) > 500
ORDER BY Total_Revenue DESC;


SELECT CONCAT(' ', c.Fname, c.Mname, c.Lname) AS FullName,c.Role,COUNT(fc.Flight_Id) AS Total_Flights
FROM CREW_MEMBER c
INNER JOIN FLIGHT_CREW fc ON c.Crew_Id = fc.Crew_Id
GROUP BY c.Crew_Id, c.Fname, c.Mname, c.Lname, c.Role
HAVING COUNT(fc.Flight_Id) > 1;


SELECT f.Flight_Number, AVG(b.Price_Paid) AS Average_Price
FROM FLIGHT f
INNER JOIN BOOKING b ON f.Flight_Id = b.Flight_Id
GROUP BY f.Flight_Id, f.Flight_Number
HAVING AVG(b.Price_Paid) > (SELECT AVG(Price_Paid) FROM BOOKING);


SELECT f.Flight_Number,d.Name AS Origin_Airport,a.Name AS Destination_Airport,
    COUNT(b.Booking_Id) AS Total_Bookings
FROM FLIGHT f
INNER JOIN AIRPORT d ON f.Departing_Airport_code = d.Airport_Id
INNER JOIN AIRPORT a ON f.Arriving_Airport_code = a.Airport_Id
INNER JOIN BOOKING b ON f.Flight_Id = b.Flight_Id
GROUP BY f.Flight_Id, f.Flight_Number, d.Name, a.Name
ORDER BY Total_Bookings DESC
LIMIT 1;


SELECT Booking_Class,SUM(Price_Paid) AS Total_Revenue,
COUNT(*) AS Number_of_Bookings,AVG(Price_Paid) AS Average_Price,
MAX(Price_Paid) AS Highest_Price,MIN(Price_Paid) AS Lowest_Price
FROM BOOKING
GROUP BY Booking_Class
ORDER BY Total_Revenue DESC;



SELECT CONCAT(' ', p.Fname, p.Mname, p.Lname) AS Passenger_Name,f.Flight_Number,
b.Booking_Date
FROM PASSENGER p
INNER JOIN BOOKING b ON p.Passenger_Id = b.Passenger_Id
INNER JOIN FLIGHT f ON b.Flight_Id = f.Flight_Id
WHERE f.Status = 'Cancelled'
ORDER BY b.Booking_Date;

SELECT f.Flight_Number,COUNT(fc.Crew_Id) AS Total_Crew,f.DepartureDateTime
FROM FLIGHT f
INNER JOIN FLIGHT_CREW fc ON f.Flight_Id = fc.Flight_Id
INNER JOIN CREW_MEMBER c ON fc.Crew_Id = c.Crew_Id
GROUP BY f.Flight_Id, f.Flight_Number, f.DepartureDateTime
HAVING 
    SUM(CASE WHEN c.Role = 'Pilot' THEN 1 ELSE 0 END) >= 1
    AND
    SUM(CASE WHEN c.Role = 'Flight Attendant' THEN 1 ELSE 0 END) >= 1
ORDER BY f.Flight_Number;



SELECT f.Flight_Number,dep.City AS Origin_City,arr.City AS Destination_City,a.Model,
    a.Manufacturer,
    COUNT(DISTINCT b.Booking_Id) AS Total_Passengers,
    COUNT(DISTINCT fc.Crew_Id) AS Total_Crew,
    IFNULL(SUM(b.Price_Paid), 0) AS Total_Revenue
FROM FLIGHT f
INNER JOIN AIRPORT dep ON f.Departing_Airport_code = dep.Airport_Id
INNER JOIN AIRPORT arr ON f.Arriving_Airport_code = arr.Airport_Id
INNER JOIN AIRCRAFT a ON f.Aircraft_Registeration_Number = a.Aircraft_Id
LEFT JOIN BOOKING b ON f.Flight_Id = b.Flight_Id
LEFT JOIN FLIGHT_CREW fc ON f.Flight_Id = fc.Flight_Id
GROUP BY f.Flight_Id, f.Flight_Number, dep.City, arr.City, a.Model, a.Manufacturer
ORDER BY Total_Revenue DESC;








