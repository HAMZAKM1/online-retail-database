-- Order Details Report
SELECT o.order_id, c.name AS customer_name, o.order_date, o.status, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;

-- Sales Report
SELECT p.name AS product_name, SUM(oi.quantity) AS total_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.name;

-- Payment Status Report
SELECT o.order_id, p.method, p.status
FROM Payments p
JOIN Orders o ON p.order_id = o.order_id;
