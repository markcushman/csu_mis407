-- Colorado State University - Global Campus
-- Database Concepts: WINTER16-D-8-MIS407-1
-- Student: Mark Cushman
-- Date: 2017-03-10

-- This script creates the triggers for the ACME Corporation CRM solution
-- This database will handle orders and customers in North America

USE acme_crm;

DROP TRIGGER IF EXISTS acme_crm.order_items_cost_before_ins_tr;
DELIMITER $$
CREATE TRIGGER acme_crm.order_items_cost_before_ins_tr BEFORE INSERT ON acme_crm.order_items
FOR EACH ROW BEGIN
  SET NEW.unit_cost = (SELECT unit_cost FROM acme_crm.items WHERE id = NEW.item_id);
  SET NEW.total_cost = NEW.quantity * NEW.unit_cost;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS acme_crm.order_total_after_ins;
DELIMITER $$
CREATE TRIGGER acme_crm.order_total_after_ins AFTER INSERT ON acme_crm.order_items
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
