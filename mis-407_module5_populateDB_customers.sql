-- Colorado State University - Global Campus
-- Database Concepts: WINTER16-D-8-MIS407-1
-- Student: Mark Cushman
-- Date: 2017-03-10

-- This script populates the database for the ACME Corporation CRM solution
-- This database will handle orders and customers in North America

-- Populate the customers table

USE acme_crm;

INSERT INTO acme_crm.customers (first_name,last_name,address1,address2,
  city,postal_code,state_province,country ) VALUES
  ('Mark','Cushman','111 Main Street',NULL,'Atlanta','30001','GA','US'),
  ('Rocky','Racoon','222 Walnut Street',NULL,'Boulder','80001','CO','US'),
  ('John','Lennon','333 High Street',NULL,'Miami','20001','FL','US'),
  ('Paul','McCartney','444 Oak Street','Apartment 1A','Los Angeles','90001','CA','US'),
  ('George','Harrison','555 Pine Street',NULL,'Phoenix','85001','AZ','US'),
  ('Ringo','Starr','666 Water Street','Unit 5','New York','10001','NY','US'),
  ('Bugs','Bunny','1 Rabbit Hole',NULL,'Pizmo Beach','90211','CA','US'),
  ('Yosemite','Sam','100 Gold Rush Ave.','Unit 1','Yukon','99999','AK','US'),
  ('Daffy','Duck','12 Bayou Lane',NULL,'Layfayette','40001','LA','US'),
  ('Bird','Tweety','500 Park Lane','Apartment 1000','New York','10001','NY','US'),
  ('Cat','Sylvester','500 Park Lane','Garage D','New York','10001','NY','US');
