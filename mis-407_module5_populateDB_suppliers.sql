-- Colorado State University - Global Campus
-- Database Concepts: WINTER16-D-8-MIS407-1
-- Student: Mark Cushman
-- Date: 2017-03-18

-- This script populates the database for the ACME Corporation CRM solution
-- This database will handle orders and suppliers in North America

-- Populate the suppliers table

USE acme_crm;

INSERT INTO acme_crm.suppliers (name,address1,address2,
  city,postal_code,state_province,country ) VALUES
  ('BMW','Kaiserdamm 90',NULL,'Berlin','14057',NULL,'DE'),
  ('REV\'IT','Reggestraat 17-27',NULL,'Oss','5340',NULL,'NL'),
  ('Kriega','4020 South 26th St.',NULL,'Philadelphia','19112','PA','US'),
  ('Dunlop','PO Box 1109',NULL,'Buffalo','14240','NY','US'),
  ('Klim','3753 East County Line Rd.',NULL,'Rigby','83442','ID','US');
