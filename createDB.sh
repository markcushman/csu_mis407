#!/bin/bash

# first remove any existing temp file
rm -rf /tmp/sql.tmp

# now concatenate all the sql commands to create and populate the DB
cat mis-407_module5_createDB.sql > /tmp/sql.tmp
cat mis-407_module5_createTriggers.sql > /tmp/sql.tmp
cat mis-407_module5_populateDB_customers.sql > /tmp/sql.tmp
cat mis-407_module5_populateDB_items.sql > /tmp/sql.tmp
cat mis-407_module5_populateDB_orders.sql > /tmp/sql.tmp
cat mis-407_module5_populateDB_order_items.sql > /tmp/sql.tmp

# now execute the commands in the concatenated file and run them through mysql
cat /tmp/sql.tmp | mysql -uroot -p
