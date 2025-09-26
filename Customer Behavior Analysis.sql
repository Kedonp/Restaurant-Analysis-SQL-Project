USE restaurant

-- 1. Combine the menu_items and irder details into a single table.
SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT *
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id;

-- 2. What were the least and most order items? What categories were they in?
SELECT item_name, COUNT(order_details) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY 1
ORDER BY 2;

SELECT item_name, COUNT(order_details) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY 1
ORDER BY 2 DESC;

SELECT item_name, category, COUNT(order_details) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY 1, 2
ORDER BY 3;

SELECT item_name, category, COUNT(order_details) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY 1, 2
ORDER BY 3 DESC;

-- 3. What were the top 5 orders that spent the most money?
SELECT order_id, ROUND(SUM(price), 2) AS total_spent
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- 4. View the details of the highest spend order. What insights can you gather from the results?
SELECT category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY 1;

-- 5. View the details of the top 5 highest spend order. What insights can you gather from the results?
SELECT category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY 1
ORDER BY 2 DESC;

SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY 1, 2;

--
-- Insights gathered from 4 & 5: The highest spenders are mostly purchasing Italian foods.
--

