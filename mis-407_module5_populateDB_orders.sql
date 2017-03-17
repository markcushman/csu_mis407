-- Colorado State University - Global Campus
-- Database Concepts: WINTER16-D-8-MIS407-1
-- Student: Mark Cushman
-- Date: 2017-03-10

-- This script populates the database for the ACME Corporation CRM solution
-- This database will handle orders and customers in North America

-- Populate the orders table

USE acme_crm;

INSERT INTO acme_crm.orders (customer_id, order_date) VALUES
  (1000, NOW() ),
  (1002, NOW() ),
  (1003, NOW() ),
  (1004, NOW() ),
  (1005, NOW() );
