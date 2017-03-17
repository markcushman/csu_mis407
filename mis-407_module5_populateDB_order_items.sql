-- Colorado State University - Global Campus
-- Database Concepts: WINTER16-D-8-MIS407-1
-- Student: Mark Cushman
-- Date: 2017-03-10

-- This script populates the database for the ACME Corporation CRM solution
-- This database will handle orders and customers in North America

-- Populate the order_items table

USE acme_crm;

INSERT INTO acme_crm.order_items (order_id, item_id, quantity) VALUES
  (100000, 100001, 1),
  (100000, 100002, 1),
  (100000, 100003, 2),
  (100001, 100004, 1),
  (100001, 100005, 1),
  (100001, 100000, 3);
