use SkyTrackAirlinedbs;

select * from flight;
update flight set Status="Completed" where Flight_id = 1;

update flight set Status="Cancelled" where Flight_id = 3;

select * from booking;




/* change cloumn class to  Booking_Class because it is Reserved  keyword*/
/* to change class to Booking_Class ,should delete the check */
SELECT CONSTRAINT_NAME, CHECK_CLAUSE
FROM INFORMATION_SCHEMA.CHECK_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'SkyTrackAirlinedbs';

ALTER TABLE BOOKING DROP CHECK booking_chk_1;

ALTER TABLE BOOKING 
CHANGE COLUMN `class` Booking_Class VARCHAR(50) NOT NULL DEFAULT 'Economy';

ALTER TABLE BOOKING 
ADD CONSTRAINT CHK_Booking_Class 
CHECK (Booking_Class IN ('Economy', 'Business', 'First'));




SET SQL_SAFE_UPDATES = 0; 
update  booking set Price_Paid = Price_Paid * 1.1  where Booking_Class='Economy';
SET SQL_SAFE_UPDATES = 1; 

update passenger set Phone='98545931' where Passenger_Id = 1;

select * from crew_member;
update crew_member set role ='Pilot' where Crew_id =5;

/*-------------delete------------------------*/

select * from flight;
select * from booking;

delete from flight where Flight_id = 5;

/*2. Delete one booking linked to a cancelled flight.

ON Casecade : so when delete flight it is deleteing auto 
in booking tables

*/



delete from passenger where Passenger_Id = 1;
/* the booking associted with passanger is also deleted
ON Casecade : so when delete passanger it is deleteing auto 
in booking tables
 */























