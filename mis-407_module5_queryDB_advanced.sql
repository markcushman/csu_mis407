-- Colorado State University - Global Campus
-- Database Concepts: WINTER16-D-8-MIS407-1
-- Student: Mark Cushman
-- Date: 2017-03-18

-- This script queries the database for the ACME Corporation CRM solution
-- This database will handle orders and customers in North America
-- These queries demonstrate advanced queries using GROUP BY, UNION
-- subqueries and JOINs

USE acme_crm;

-- Demonstrate the use of a GROUP BY clause, with a HAVING
-- clause and one or more group functions
-- This query returns all the orders, grouped by customer_id
-- and having a value of over $2000
SELECT customer_id, SUM(order_total)
FROM acme_crm.orders
GROUP BY customer_id
HAVING SUM(order_total) >= 2000;

-- Demonstrate the use of a UNION operator
-- This query returns all the names and addresses of customers and suppliers

SELECT first_name, last_name, address1, address2,
  city, postal_code, state_province, country
  FROM acme_crm.customers
UNION
SELECT name, name, address1, address2, city,
    postal_code, state_province, country
    FROM acme_crm.suppliers;

-- Demonstrate the use of a subquery
-- This query returns all the customers in the database, including their total
-- spend in orders in the new column total_spend
SELECT
  first_name, last_name, address1, address2, city,
  postal_code, state_province, country,
  (SELECT SUM(order_total) FROM acme_crm.orders
  WHERE customers.id = customer_id GROUP BY customer_id) AS total_spend
FROM acme_crm.customers;


-- Demonstrate the use of a subquery
-- This query builds on the previous query, allowing us to see the total_spend
-- where the amount is above $2000
SELECT * FROM (
  SELECT first_name, last_name, address1, address2, city,
    postal_code, state_province, country,
    (SELECT SUM(order_total) FROM acme_crm.orders
    WHERE customers.id = customer_id GROUP BY customer_id) AS total_spend
  FROM acme_crm.customers)
AS spend
WHERE spend.total_spend > 2000;

-- Demonstrate the use of an outer join
-- Since MySQL doesn't have a FULL OUTER JOIN operator, we have to use a
-- LEFT JOIN and a RIGHT JOIN and use the UNION operator to combine
SELECT * FROM acme_crm.customers
  LEFT JOIN acme_crm.orders ON customers.id = orders.customer_id
UNION
  SELECT * FROM acme_crm.customers
  RIGHT JOIN acme_crm.orders ON customers.id = orders.customer_id;

-- Demonstrate the use of querying a view
-- Here we are querying the top customers view where the total_spend
-- is greater than $2000
SELECT *
  FROM acme_crm.top_customers_vw
  WHERE total_spend > 2000;
