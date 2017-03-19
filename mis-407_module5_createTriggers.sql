-- Colorado State University - Global Campus
-- Database Concepts: WINTER16-D-8-MIS407-1
-- Student: Mark Cushman
-- Date: 2017-03-10

-- This script creates the triggers for the ACME Corporation CRM solution
-- This database will handle orders and customers in North America

USE acme_crm;

-- First drop the trigger
DROP TRIGGER IF EXISTS acme_crm.order_items_cost_before_ins_tr;
-- Change the delimiter to $$ so we can add multiple statements inside the
-- create trigger logic
DELIMITER $$
-- Now create our trigger, the first step is to set the unit cost to a lookup
-- from the unit_cost table
-- Next step is to set the total_cost to the unit_cosst * quantity
CREATE TRIGGER acme_crm.order_items_cost_before_ins_tr BEFORE INSERT ON acme_crm.order_items
FOR EACH ROW BEGIN
  SET NEW.unit_cost = (SELECT unit_cost FROM acme_crm.items WHERE id = NEW.item_id);
  SET NEW.total_cost = NEW.quantity * NEW.unit_cost;
END$$
DELIMITER ;

-- First drop the trigger
DROP TRIGGER IF EXISTS acme_crm.order_total_after_ins_tr;
-- Change the delimiter to $$ so we can add multiple statements inside the
-- create trigger logic
DELIMITER $$
-- We have to create a trigger that updates the order_total in the orders table
-- from the sum of the order_items table
CREATE TRIGGER acme_crm.order_total_after_ins_tr AFTER INSERT ON acme_crm.order_items
  FOR EACH ROW BEGIN
    UPDATE acme_crm.orders
      SET order_total = (
        SELECT sum(total_cost)
          FROM (SELECT total_cost, order_id FROM acme_crm.order_items) AS oi
          WHERE oi.order_id=NEW.order_id
        )
      WHERE id = NEW.order_id;
  END$$
DELIMITER ;
