-- Colorado State University - Global Campus
-- Database Concepts: WINTER16-D-8-MIS407-1
-- Student: Mark Cushman
-- Date: 2017-03-18

-- This script updates the database for the ACME Corporation CRM solution
-- This database will handle orders and customers in North America

USE acme_crm;

-- Update the ship_date column for a specific order_date
UPDATE acme_crm.orders SET ship_date = NOW() WHERE order_id = '100000';

-- Purge anyone with the last name Cushman from the database
-- including all of their orders

-- first delete the order_items
DELETE FROM acme_crm.order_items
WHERE order_id IN (
  SELECT id
  FROM acme_crm.orders
  WHERE customer_id = (
    SELECT id
    FROM acme_crm.customers
    WHERE last_name = 'Cushman')
  );

-- Then delete all the orders
DELETE FROM acme_crm.orders
WHERE customer_id = (
  SELECT id
  FROM acme_crm.customers
  WHERE last_name = 'Cushman'
);

-- Now finally remove the customer record
DELETE FROM acme_crm.customers
  WHERE last_name = 'Cushman';
