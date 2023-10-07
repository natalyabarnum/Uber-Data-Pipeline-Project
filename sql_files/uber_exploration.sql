SELECT VendorID, AVG(fare_amount) FROM `uber-test-project-401219.uber_data_project.fact_table`
GROUP BY VendorID;

# Average tip amount based on payment type
SELECT b.payment_type_name, AVG(a.tip_amount) FROM `uber-test-project-401219.uber_data_project.fact_table` a
JOIN `uber_data_project.payment_type_dim` b
ON a.payment_type_id = b.payment_type_id
GROUP BY b.payment_type_name;

# Top 10 pickup locations based on number of trips
SELECT pickup_location_id, COUNT(*) as number_of_trips
FROM `uber_data_project.fact_table`
GROUP BY pickup_location_id
ORDER BY number_of_trips DESC
LIMIT 10;

# Total number of trips by passenger count
SELECT passenger_count_id, COUNT(*) as passenger_count
FROM `uber_data_project.fact_table`
GROUP BY passenger_count_id;

# Average fare amount by hour of the day
SELECT b.pickup_hour, AVG(a.fare_amount) as Average_Fare_Amount 
FROM `uber_data_project.fact_table` a
JOIN `uber_data_project.datetime_dim` b
ON a.datetime_id = b.datetime_id
GROUP BY b.pickup_hour;
