create database Ola;
use ola;

#1. Retrieve all successful bookings:
create view successful_bookings as
select * from bookings
where booking_status = 'success';

select * from successful_bookings;


#2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select vehicle_type, avg(ride_distance)
as avg_distance from bookings
group by vehicle_type;

select * from ride_distance_for_each_vehicle;


#3. Get the total number of canceled rides by customers:
create view canceled_rides_by_customers as
select count(*) from bookings
where booking_status = 'canceled by customer';

select * from canceled_rides_by_customers;


#4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select customer_id, count(booking_id) as total_rides
from bookings
group by customer_id
order by total_rides desc limit 5;

select * from top_5_customers;


#5. Get the number of rides canceled by drivers due to personal and car-related issues:
create view rides_canceled_by_drivers_p_c_issues as
select count(*) from bookings
where canceled_rides_by_driver = 'personal & car related issue';


select * from rides_canceled_by_drivers_p_c_issues;


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_rating as
select max(driver_ratings) as max_rating,
min(driver_ratings) as min_rating
from bookings where vehicle_type = 'Prime_Sedan';

select * from max_min_driver_rating;


#7. Retrieve all rides where payment was made using UPI:
create view upi_payment as
select * from bookings
where payment_method = 'upi';

select * from upi_payment;


#8. Find the average customer rating per vehicle type:
create view avg_cust_rating as	
select vehicle_type, avg(customer_rating) as avg_customer_rating
from bookings
group by vehicle_type; 

select * from avg_cust_rating;


#9. Calculate the total booking value of rides completed successfully:
create view total_successful_ride_value as
select sum(booking_value) as total_successful_ride_value
from bookings
where booking_status = 'success';

select * from total_successful_ride_value;


#10. List all incomplete rides along with the reason:
 create view incomplete_rides_reason as
 select booking_id, incomplete_rides_reason
 from bookings
 where incomplete_rides = 'yes';
 
 select * from incomplete_rides_reason;