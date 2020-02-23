

-- What countries sold the most?
SELECT unique NLS_TERRITORY
        FROM oe.Customers
        RIGHT JOIN oe.Orders
        ON ORDERS.CUSTOMER_ID = CUSTOMERS.CUSTOMER_ID

--Confirm no customers outside america made an order      
SELECT NLS_TERRITORY, customers.customer_ID
        FROM oe.Customers
        RIGHT JOIN oe.Orders
        ON ORDERS.CUSTOMER_ID = CUSTOMERS.CUSTOMER_ID
        where orders.customer_id > 308;
        
-- which sales reps have sold the most?
SELECT sales_rep_id, count(order_id), sum(order_total)
FROM orders
WHERE order_mode like 'direct'
GROUP BY sales_rep_id

--view null values
SELECT *
FROM orders
WHERE sales_rep_id is null
AND order_mode like 'direct'

--remove null values
SELECT sales_rep_id, count(order_id) as num_sales, sum(order_total) as total_revenue, round(sum(order_total)/count(order_id), 2) as Average_Sale
FROM orders
WHERE order_mode like 'direct' AND sales_rep_id is not null
GROUP BY sales_rep_id
ORDER BY total_revenue desc

-- What time of day yeilds the most online sales? 
SELECT TO_CHAR(order_date, 'PM') as time_of_day, count(order_id) as num_sales
FROM orders
WHERE order_mode like 'online'
group by TO_CHAR(order_date, 'PM')

--What month yeilds the most online sales?
SELECT TO_CHAR(order_date, 'MON') as sale_mon, count(order_id) as num_sales
FROM orders
WHERE order_mode like 'online'
group by TO_CHAR(order_date, 'MON')