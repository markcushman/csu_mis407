#!/bin/bash

# first remove any existing temp file
rm -rf /tmp/query_sql.tmp

# now concatenate all the sql commands to query the DB
cat mis-407_module5_queryDB.sql > /tmp/query_sql.tmp
cat mis-407_module5_queryDB_advanced.sql >> /tmp/query_sql.tmp

# now execute the commands in the concatenated file and run them through mysql
cat /tmp/query_sql.tmp | mysql -uroot -p -t -vvv

# clean up
rm -rf /tmp/query_sql.tmp
