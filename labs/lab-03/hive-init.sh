#!/bin/sh

CONTAINER=lab-03_hive-node-01_1

docker exec --user root $CONTAINER hive-init.sh
