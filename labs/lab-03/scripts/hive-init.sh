#!/bin/sh

gosu hdfs hdfs dfs -mkdir /tmp
gosu hdfs hdfs dfs -chmod 777 /tmp

gosu hdfs hdfs dfs -mkdir /mapred
gosu hdfs hdfs dfs -chmod 777 /mapred

gosu hdfs hdfs dfs -mkdir /mapred/staging
gosu hdfs hdfs dfs -chmod 777 /mapred/staging

gosu hdfs hdfs dfs -mkdir  /mapred/staging/history
gosu hdfs hdfs dfs -chmod 777 /mapred/staging/history

gosu hdfs hdfs dfs -mkdir /tmp/hive_temp
gosu hdfs hdfs dfs -chown hive:hadoop /tmp/hive_temp
gosu hdfs hdfs dfs -chmod 777 /tmp/hive_temp

gosu hdfs hdfs dfs -mkdir -p /user/hive
gosu hdfs hdfs dfs -chown hive:hive /user/hive
gosu hdfs hdfs dfs -mkdir -p /user/hue
gosu hdfs hdfs dfs -chown hive:hive /user/hue

gosu hdfs init-hive-dfs.sh

gosu hdfs hdfs chown -R hive:hive /user/hive

schematool -dbType mysql -initSchema

gosu root chmod -R 777 /var/log/hadoop
