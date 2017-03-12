-- Colorado State University - Global Campus
-- Database Concepts: WINTER16-D-8-MIS407-1
-- Student: Mark Cushman
-- Date: 2017-03-10

-- This script creates the database for the ACME Corporation CRM solution
-- This database will handle orders and customers in North America

-- First, create the database if it does not exist and switch to that db
-- We will continue to use fully qualified table names for good style
CREATE DATABASE IF NOT EXISTS acme_crm;
USE acme_crm;

-- We drop tables if they exist so we can re-create them
-- Alternately we could use CREATE TABLE IF NOT EXISTS
-- Creation order is important here, we need to create tables
-- first that do not have foreign key constraints

-- Create the item table which is the record for each individual item
DROP TABLE IF EXISTS acme_crm.item;
CREATE TABLE acme_crm.item (
  id INT NOT NULL AUTO_INCREMENT = 100000, -- unique ID of the item
  unit_cost DECIMAL(9,2) NOT NULL, -- current cost of the item
  description VARCHAR(1024) NOT NULL, -- text description of the item
  PRIMARY KEY (id)
);

-- Create the customer table that contains customer records
DROP TABLE IF EXISTS acme_crm.customer;
CREATE TABLE acme_crm.customer (
  id INT NOT NULL AUTO_INCREMENT = 1000, -- unique ID of the customer
  first_name VARCHAR(30) NOT NULL, -- customer’s first name
  last_name VARCHAR(30) NOT NULL, -- customer’s last name
  address1 VARCHAR(30) NOT NULL, -- street address
  address2 VARCHAR(30), -- secondary street address
  city VARCHAR(30) NOT NULL, --city
  postal_code VARCHAR(6) NOT NULL, -- zip or postal code (MX has 6 char postal)
  state_province VARCHAR(3) NOT NULL, -- state or province (MX has 3 char state)
  country VARCHAR(2) NOT NULL, -- country code (US, CA, MX)
  PRIMARY KEY (id)
);

-- Now move on to the tables that have foreign key constraints on tables
-- that we have already created

-- Create the order table that contains order records linked to order_item
DROP TABLE IF EXISTS acme_crm.order;
CREATE TABLE acme_crm.order (
  id INT NOT NULL AUTO_INCREMENT = 100000, -- unique ID of this order
  customer_id INT NOT NULL, -- id of the customer
  order_date DATETIME NOT NULL, -- date the order was placed
  ship_date DATETIME NOT NULL, -- date the order was shipped
  order_total DECIMAL(9,2) NOT NULL, -- total cost of the order
  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES acme_crm.customer(id)
);

-- Create the order_item table which is a child of order
DROP TABLE IF EXISTS acme_crm.order_item;
CREATE TABLE acme_crm.order_item (
  id INT NOT NULL AUTO_INCREMENT = 100000, -- unique ID of the order line
  order_id INT NOT NULL, -- id of the order
  item_id INT NOT NULL, -- id of the item ordered
  unit_cost DECIMAL(9,2) NOT NULL, -- cost of the item at the time of order
  quantity INT NOT NULL, -- number of items ordered
  total_cost DECIMAL(9,2) NOT NULL,-- unit_cost x quantity
  PRIMARY KEY (id)
  FOREIGN KEY (order_id) REFERENCES acme_crm.order(id)
  FOREIGN KEY (item_id) REFERENCES acme_crm.item(id)
);
