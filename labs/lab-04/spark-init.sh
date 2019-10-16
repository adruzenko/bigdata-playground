#!/bin/sh
CONTAINER=lab-04_hdfs-namenode-01_1

docker exec --user hdfs $CONTAINER hdfs dfs -mkdir /spark
docker exec --user hdfs $CONTAINER hdfs dfs -chmod 777 /spark
docker exec --user hdfs $CONTAINER hdfs dfs -mkdir /spark/logs
docker exec --user hdfs $CONTAINER hdfs dfs -chmod 777 /spark/logs
