use restaurant_orders;

/* 1. How many rolls were ordered */

select count(roll_id) as rolls_ordered from customer_orders;

/* 2. How many unique customers who ordered from this restaurant? */

select count(distinct customer_id) as no_of_unique_customers from customer_orders;

/* 3. How many successful orders were delivered by each driver? */

/* Clean the data using case statement /*

select *, case when cancellation in ('cancellation', 'customer cancellation') then 'c' else 'nc' end as order_cancel_details 
from driver_order;

/* Use this table as CTE using WITH Clause /*

WITH clean_driver_order_CTE AS (select *, case when cancellation in ('cancellation', 'customer cancellation') 
then 'c' else 'nc' end as order_cancel_details from driver_order)

select driver_id, count(distinct order_id) as successful_delivery from clean_driver_order_CTE 
where order_cancel_details in ('nc') group by driver_id;

/* 4. How many of each type of rolls were delivered /*

WITH clean_driver_order_CTE AS (select *, case when cancellation in ('cancellation', 'customer cancellation') 
then 'c' else 'nc' end as order_cancel_details from driver_order)

select roll_id, count(roll_id) from customer_orders where order_id in (select order_id from clean_driver_order_CTE 
where order_cancel_details='nc') group by roll_id;

/* 5. How many veg and non veg rolls were ordered by each customer /*

/* Method 1 using multiple group by /*

select a.*,b.roll_name from (select customer_id, roll_id, count(roll_id) from customer_orders group by customer_id,roll_id) 
as a join rolls as b on a.roll_id=b.roll_id;

/ * Method 2 using Window function /*

select a.*,b.roll_name from (select customer_id, roll_id, count(roll_id) over(partition by customer_id order by roll_id) 
as total_rolls_ordered from customer_orders) as a join rolls as b on a.roll_id=b.roll_id;

/* 6. What was the maximum number of rolls delivered in a single order? /*

WITH clean_driver_order_CTE AS (select *, case when cancellation in ('cancellation', 'customer cancellation') 
then 'c' else 'nc' end as order_cancel_details from driver_order),

customer_orders_CTE AS (select * from customer_orders where order_id in 
(select order_id from clean_driver_order_CTE where order_cancel_details='nc')),

count_CTE AS (select order_id, count(roll_id) as cnt from customer_orders_CTE group by order_id)

select *, rank() over(order by cnt desc) as rnk from count_CTE;

/* 7. What was the total number of rolls ordered for each hour of the day? /*

select hours_bracket, count(hours_bracket) from 
(select *, concat(cast(hour(order_date) as char), '-' , cast(hour(order_date) + 1 as char)) as hours_bracket from customer_orders)
 as a group by hours_bracket order by hours_bracket;

/* 8. What was the number of orders for each day of the week /*

select dayofweek, count(distinct order_id) from 
(select *, dayname(order_date) as dayofweek from customer_orders) as a group by dayofweek;

/* 9. What was the average time in minutes it took for each driver to arrive at restaurant to pickup the order? /*

select driver_id, sum(diff)/count(order_id) as average from
(select *, row_number() over(partition by order_id order by diff) as rnk from
(select a.*, b.driver_id, b.pickup_time, timestampdiff(minute,a.order_date,b.pickup_time)
as diff from customer_orders as a join driver_order as b on a.order_id=b.order_id where b.pickup_time is not null) as a) as b where rnk=1
group by driver_id;

/* 10. What is the successful delivery percentage for each driver?

select driver_id,sum(cancel_order) as successful_delivery, count(driver_id) as total_delivery, (sum(cancel_order)/count(driver_id))*100
as successful_Delivery_percent from
(select driver_id, case when lower(cancellation) like "%cancel%" then 0 else 1 end as cancel_order from driver_order) as a 
group by driver_id


