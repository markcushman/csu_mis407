-- Colorado State University - Global Campus
-- Database Concepts: WINTER16-D-8-MIS407-1
-- Student: Mark Cushman
-- Date: 2017-03-10

-- This script creates the triggers for the ACME Corporation CRM solution
-- This database will handle orders and customers in North America

USE acme_crm;

DROP TRIGGER IF EXISTS acme_crm.order_items_unit_cost_before_ins_tr;
CREATE TRIGGER acme_crm.order_items_unit_cost_before_ins_tr BEFORE INSERT ON acme_crm.order_items
  FOR EACH ROW SET NEW.unit_cost = SELECT unit_cost FROM acme_crm.items WHERE id = NEW.item_id;

DROP TRIGGER IF EXISTS acme_crm.order_items_total_before_ins_tr;
CREATE TRIGGER acme_crm.order_items_total_before_ins_tr BEFORE INSERT ON acme_crm.order_items
  FOR EACH ROW SET NEW.total_cost = (SELECT unit_cost FROM acme_crm.items WHERE id = NEW.item_id) * NEW.quantity;

DROP TRIGGER IF EXISTS acme_crm.order_total_after_ins;
DELIMITER $$
CREATE TRIGGER acme_crm.order_total_after_ins AFTER INSERT on acme_crm.order_items
  FOR EACH ROW BEGIN
    UPDATE acme_crm.orders
      SET total_cost = (select sum(total_cost) from acme_crm.order_items where order_id=OLD.order_id)
      WHERE id = OLD.order_id;
  END$$
DELIMITER ;
