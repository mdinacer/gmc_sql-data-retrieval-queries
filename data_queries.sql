-- SQL Data Retrieval Queries

-- 1. Display all the data of customers
SELECT * FROM Customer;

-- 2. Display the product_name and category for products which their price is between 5000 and 10000
SELECT product_name, category 
FROM Product 
WHERE Price BETWEEN 5000 AND 10000;

-- 3. Display all the data of products sorted in descending order of price
SELECT * FROM Product 
ORDER BY Price DESC;

-- 4. Display the total number of orders, the average amount, the highest total amount and the lower total amount
SELECT 
    COUNT(*) AS total_orders,
    AVG(total_amount) AS average_amount,
    MAX(total_amount) AS highest_amount,
    MIN(total_amount) AS lowest_amount
FROM Orders;

-- 5. For each product_id, display the number of orders
SELECT Product_id, COUNT(*) AS number_of_orders
FROM Orders
GROUP BY Product_id;

-- 6. Display the customer_id which has more than 2 orders
SELECT Customer_id
FROM Orders
GROUP BY Customer_id
HAVING COUNT(*) > 2;

-- 7. For each month of the 2020 year, display the number of orders
SELECT 
    EXTRACT(MONTH FROM OrderDate) AS month,
    COUNT(*) AS number_of_orders
FROM Orders
WHERE EXTRACT(YEAR FROM OrderDate) = 2020
GROUP BY EXTRACT(MONTH FROM OrderDate)
ORDER BY month;

-- 8. For each order, display the product_name, the customer_name and the date of the order
SELECT 
    p.product_name,
    c.customer_Name,
    o.OrderDate
FROM Orders o
JOIN Product p ON o.Product_id = p.Product_id
JOIN Customer c ON o.Customer_id = c.Customer_id;

-- 9. Display all the orders made three months ago
SELECT *
FROM Orders
WHERE OrderDate >= ADD_MONTHS(SYSDATE, -3)
AND OrderDate < ADD_MONTHS(SYSDATE, -2);

-- 10. Display customers (customer_id) who have never ordered a product
SELECT Customer_id
FROM Customer
WHERE Customer_id NOT IN (
    SELECT DISTINCT Customer_id 
    FROM Orders 
    WHERE Customer_id IS NOT NULL
);
