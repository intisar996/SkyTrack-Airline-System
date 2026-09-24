
/*****************Basic Level*******************/
select Flight_number,Status from flight order by DepartureDateTime; 

select Fname from passenger order by Fname ASC;

select Registration_Number, Total_Seating_Capacity from aircraft order by Total_Seating_Capacity desc;

select distinct Booking_Class from booking ;

select * from flight where Status='Delayed' or Status ='Cancelled' ;

select * from passenger where Nationality='Omani';

select * from airport order by Country;



 



