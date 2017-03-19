#!/bin/bash

# first remove any existing temp file
rm -rf /tmp/update_sql.tmp

# now concatenate all the sql commands to update the DB
cat mis-407_module5_updateDB_customer.sql > /tmp/update_sql.tmp

# now execute the commands in the concatenated file and run them through mysql
cat /tmp/update_sql.tmp | mysql -uroot -p -vv

# clean up
rm -rf /tmp/update_sql.tmp
