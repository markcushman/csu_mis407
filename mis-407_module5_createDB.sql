-- Colorado State University - Global Campus
-- Database Concepts: WINTER16-D-8-MIS407-1
-- Student: Mark Cushman
-- Date: 2017-03-10

-- This script creates the database for the ACME Corporation CRM solution
-- This database will handle orders and customers in North America

-- First, create the database if it does not exist and switch to that db
-- We will continue to use fully qualified table names for good style
DROP DATABASE IF EXISTS acme_crm;
CREATE DATABASE IF NOT EXISTS acme_crm;
USE acme_crm;

-- We drop tables if they exist so we can re-create them
-- Alternately we could use CREATE TABLE IF NOT EXISTS
-- Creation order is important here, we need to create tables
-- first that do not have foreign key constraints

-- Create the item table which is the record for each individual item
DROP TABLE IF EXISTS acme_crm.items;
CREATE TABLE acme_crm.items (
  id INT NOT NULL AUTO_INCREMENT, /* unique ID of the item */
  unit_cost DECIMAL(9,2) NOT NULL, /* current cost of the item */
  description VARCHAR(1024) NOT NULL, /* text description of the item */
  PRIMARY KEY (id)
);
-- Make the id column auto increment from 100000
ALTER TABLE acme_crm.items AUTO_INCREMENT = 100000;

-- Create the customer table that contains customer records
DROP TABLE IF EXISTS acme_crm.customers;
CREATE TABLE acme_crm.customers (
  id INT NOT NULL AUTO_INCREMENT, /* unique ID of the customer */
  first_name VARCHAR(30) NOT NULL, /* customer’s first name */
  last_name VARCHAR(30) NOT NULL, /* customer’s last name */
  address1 VARCHAR(30) NOT NULL, /* street address */
  address2 VARCHAR(30), /* secondary street address */
  city VARCHAR(30) NOT NULL, /* city */
  postal_code VARCHAR(6) NOT NULL, /* zip or postal code (MX has 6 char postal) */
  state_province VARCHAR(3) NOT NULL, /* state or province (MX has 3 char state) */
  country VARCHAR(2) NOT NULL, /* country code (US, CA, MX) */
  PRIMARY KEY (id)
);
-- Make the id column auto increment from 1000
ALTER TABLE acme_crm.customers AUTO_INCREMENT = 1000;

-- Create the suppliers table that contains supplier records
DROP TABLE IF EXISTS acme_crm.suppliers;
CREATE TABLE acme_crm.suppliers (
  id INT NOT NULL AUTO_INCREMENT, /* unique ID of the supplier */
  name VARCHAR(30) NOT NULL, /* customer’s first name */
  address1 VARCHAR(30) NOT NULL, /* street address */
  address2 VARCHAR(30), /* secondary street address */
  city VARCHAR(30) NOT NULL, /* city */
  postal_code VARCHAR(6) NOT NULL, /* zip or postal code (MX has 6 char postal) */
  state_province VARCHAR(3), /* state or province (MX has 3 char state) */
  country VARCHAR(2) NOT NULL, /* country code (US, CA, MX) */
  PRIMARY KEY (id)
);
-- Make the id column auto increment from 1000
ALTER TABLE acme_crm.suppliers AUTO_INCREMENT = 1000;

-- Now move on to the tables that have foreign key constraints on tables
-- that we have already created

-- Create the order table that contains order records linked to order_item
DROP TABLE IF EXISTS acme_crm.orders;
CREATE TABLE acme_crm.orders (
  id INT NOT NULL AUTO_INCREMENT, /* unique ID of this order */
  customer_id INT NOT NULL, /* id of the customer */
  order_date DATETIME NOT NULL, /* date the order was placed */
  ship_date DATETIME, /* date the order was shipped */
  order_total DECIMAL(9,2) DEFAULT 0, /* total cost of the order */
  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES acme_crm.customers(id)
);
-- Make the id column auto increment from 100000
ALTER TABLE acme_crm.orders AUTO_INCREMENT = 100000;

-- Create the order_item table which is a child of order
DROP TABLE IF EXISTS acme_crm.order_items;
CREATE TABLE acme_crm.order_items (
  id INT NOT NULL AUTO_INCREMENT, /* unique ID of the order line */
  order_id INT NOT NULL, /* id of the order from order table */
  item_id INT NOT NULL, /* id of the item ordered */
  unit_cost DECIMAL(9,2) NOT NULL, /* cost of the item at the time of order */
  quantity INT NOT NULL, /* number of items ordered */
  total_cost DECIMAL(9,2) NOT NULL, /* unit_cost x quantity */
  PRIMARY KEY (id),
  FOREIGN KEY (order_id) REFERENCES acme_crm.orders(id),
  FOREIGN KEY (item_id) REFERENCES acme_crm.items(id)
);
-- Make the id column auto increment from 100000
ALTER TABLE acme_crm.order_items AUTO_INCREMENT = 100000;
