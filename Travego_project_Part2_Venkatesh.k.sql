                                    --           Part 2               --
use travego;

-- a. How many females and how many male passengers traveled a minimum distance of 600 KMs--
select gender,count(*) no_of_passengers from passenger where distance >=600 
group by 1;

-- b. Find the minimum ticket price of a Sleeper Bus. --
select min(price)min_price from price where bus_type='sleeper';

-- c. Select passenger names whose names start with character 'S' --
select passenger_name from passenger 
where passenger_name like 's%';

-- d. Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output -- 
select passenger.passenger_id,passenger.passenger_name,passenger.boarding_city,passenger.destination_city,passenger.bus_type,price.price 
from passenger,price where passenger.distance = price.distance;
#or
select distinct(passenger_id),passenger_name,boarding_city,destination_city,price,price.bus_type 
from passenger left join price on passenger.distance = price.distance;


 -- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?   -- 
select passenger_name,price
FROM passenger pa,price pr where pa.distance >=1000 and pa.bus_type ='Sitting';

-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji? --
select * from passenger where passenger_name='pallavi';
select bus_type,price from price where distance = (select distance from passenger where passenger_name = 'Pallavi');


-- g. List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order. -- 
select distinct(distance) dist from passenger order by dist  desc;

-- h. Display the passenger name and percentage of distance traveled by that passenger from the total distance traveled by all passengers without using user variables  -- 
SELECT Passenger_name, (Distance / (SELECT SUM(Distance) FROM Passenger)) * 100 Percentage_distance
FROM Passenger;