-- Colorado State University - Global Campus
-- Database Concepts: WINTER16-D-8-MIS407-1
-- Student: Mark Cushman
-- Date: 2017-03-10

-- This script populates the database for the ACME Corporation CRM solution
-- This database will handle orders and customers in North America

-- Populate the items table

USE acme_crm;

INSERT INTO acme_crm.items (unit_cost,description) VALUES
  (469.99, 'REV\'IT! Blake Jacket'),
  (164.25, 'Sena SMH10R Bluetooth Headset'),
  (485.99, 'Shoei RF-1200 Helmet - Solid'),
  (135.35, 'Dunlop Q3 Sportmax Tire'),
  (89.95, 'Dianese MIG C2 Gloves'),
  (28.55, 'RAM Mounts Universal Cell Phone Holder'),
  (29.95, 'NoNoise Motorsport Noise Filter Ear Protection');
