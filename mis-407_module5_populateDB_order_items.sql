-- Colorado State University - Global Campus
-- Database Concepts: WINTER16-D-8-MIS407-1
-- Student: Mark Cushman
-- Date: 2017-03-10

-- This script populates the database for the ACME Corporation CRM solution
-- This database will handle orders and customers in North America

-- Populate the order_items table

USE acme_crm;

INSERT INTO acme_crm.order_items (order_id, item_id, unit_cost,
    quantity, total_cost) VALUES
  (100000, 100001, 164.25, 1, 164.25),
  (100000, 100002, 485.99, 1, 485.99),
  (100000, 100003, 135.35, 2, 270.7),
  (100001, 100004, 89.95, 1, 89.95),
  (100001, 100005, 28.55, 1, 28.55),
  (100001, 100000, 469.99, 1, 469.99);
