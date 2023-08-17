SELECT order_date FROM pizza_sales;

#---- A -  KPI's ------

# 1 - Total Revenue - 817860,05:
SELECT SUM(total_price) AS Total_Revenue from pizza_sales;

# 2 - Average Order Value - 38,30:
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_value FROM pizza_sales;

# 3 - Total pizzas Sold - 49574
SELECT SUM(quantity) AS Total_pizzas_sold FROM pizza_sales;

# 4 - Total Orders  - 21350 pizza_sales
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

# 5. Average Pizzas Per Order - 2.32
# SIN decimal
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Avg_pizzas_per_order from pizza_sales;
# PASADO a decimal 10,2
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;

#---- B -  Daily Trend for Total Orders -----

SELECT DAY(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAY(order_date);

#---- C. Monthly Trend for Orders -----

SELECT MONTH(order_date) AS Month_Number, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY MONTH(order_date);

#---- D.  % of Sales by Pizza Category -----

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

#---- E. % of Sales by Pizza Size -----

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

#---- F Total Pizzas Sold by Pizza Category -----

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

#---- G. Top 5 Pizzas by Revenue -----

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

#---- H. Bottom 5 Pizzas by Revenue -----

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;

#---- I  Top 5 Pizzas by Quantity -----

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;

#---- J. Bottom 5 Pizzas by Quantity -----

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;


#---- K. Top 5 Pizzas by Total Orders -----

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

#---- L. Bottom 5 Pizzas by Total Orders -----

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;








