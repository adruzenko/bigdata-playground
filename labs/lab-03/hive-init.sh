#!/bin/sh

CONTAINER=lab-03_hive-node-01_1

docker exec $CONTAINER gosu hdfs hdfs dfs -mkdir /tmp
docker exec $CONTAINER gosu hdfs hdfs dfs -chmod 777 /tmp

docker exec $CONTAINER gosu hdfs hdfs dfs -mkdir /mapred
docker exec $CONTAINER gosu hdfs hdfs dfs -chmod 777 /mapred

docker exec $CONTAINER gosu hdfs hdfs dfs -mkdir /mapred/staging
docker exec $CONTAINER gosu hdfs hdfs dfs -chmod 777 /mapred/staging

docker exec $CONTAINER gosu hdfs hdfs dfs -mkdir  /mapred/staging/history
docker exec $CONTAINER gosu hdfs hdfs dfs -chmod 777 /mapred/staging/history

docker exec $CONTAINER gosu hdfs hdfs dfs -mkdir /tmp/hive_temp
docker exec $CONTAINER gosu hdfs hdfs dfs -chown hive:hadoop /tmp/hive_temp
docker exec $CONTAINER gosu hdfs hdfs dfs -chmod 777 /tmp/hive_temp

docker exec $CONTAINER gosu hive init-hive-dfs.sh
docker exec $CONTAINER schematool -dbType mysql -initSchema


