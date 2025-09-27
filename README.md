# SQL Data Retrieval Queries

## Overview
This exercise involves writing SQL queries to retrieve data from relational database tables using DQL (Data Query Language) commands.

## Database Schema
- **Customer** (Customer_id, customer_Name, customer_Tel)
- **Product** (Product_id, product_name, category, Price)
- **Orders** (#Customer_id, #Product_id, OrderDate, quantity, total_amount)

## Instructions
Write SQL commands to perform the following data retrieval operations:

### 1. Display all the data of customers
```sql
SELECT * FROM Customer;
```

### 2. Display the product_name and category for products which their price is between 5000 and 10000
```sql
SELECT product_name, category 
FROM Product 
WHERE Price BETWEEN 5000 AND 10000;
```

### 3. Display all the data of products sorted in descending order of price
```sql
SELECT * FROM Product 
ORDER BY Price DESC;
```

### 4. Display the total number of orders, the average amount, the highest total amount and the lower total amount
```sql
SELECT 
    COUNT(*) AS total_orders,
    AVG(total_amount) AS average_amount,
    MAX(total_amount) AS highest_amount,
    MIN(total_amount) AS lowest_amount
FROM Orders;
```

### 5. For each product_id, display the number of orders
```sql
SELECT Product_id, COUNT(*) AS number_of_orders
FROM Orders
GROUP BY Product_id;
```

### 6. Display the customer_id which has more than 2 orders
```sql
SELECT Customer_id
FROM Orders
GROUP BY Customer_id
HAVING COUNT(*) > 2;
```

### 7. For each month of the 2020 year, display the number of orders
```sql
SELECT 
    EXTRACT(MONTH FROM OrderDate) AS month,
    COUNT(*) AS number_of_orders
FROM Orders
WHERE EXTRACT(YEAR FROM OrderDate) = 2020
GROUP BY EXTRACT(MONTH FROM OrderDate)
ORDER BY month;
```

### 8. For each order, display the product_name, the customer_name and the date of the order
```sql
SELECT 
    p.product_name,
    c.customer_Name,
    o.OrderDate
FROM Orders o
JOIN Product p ON o.Product_id = p.Product_id
JOIN Customer c ON o.Customer_id = c.Customer_id;
```

### 9. Display all the orders made three months ago
```sql
SELECT *
FROM Orders
WHERE OrderDate >= ADD_MONTHS(SYSDATE, -3)
AND OrderDate < ADD_MONTHS(SYSDATE, -2);
```

### 10. Display customers (customer_id) who have never ordered a product
```sql
SELECT Customer_id
FROM Customer
WHERE Customer_id NOT IN (
    SELECT DISTINCT Customer_id 
    FROM Orders 
    WHERE Customer_id IS NOT NULL
);
```
