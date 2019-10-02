KBD_DATA_DIR ?= ../.kbd
dirs= \
  ${KBD_DATA_DIR}/hdfs-namenode-01/logs \
  ${KBD_DATA_DIR}/hdfs-namenode-01/dfs \
  ${KBD_DATA_DIR}/hdfs-datanode-01/logs \
  ${KBD_DATA_DIR}/hdfs-datanode-01/dfs \
  ${KBD_DATA_DIR}/yarn-resourcemanager-01/logs \
  ${KBD_DATA_DIR}/yarn-nodemanager-01/logs \
  ${KBD_DATA_DIR}/yarn-nodemanager-01/tmp/mapred \
  ${KBD_DATA_DIR}/mapred-historyserver-01/logs \
  ${KBD_DATA_DIR}/mapred-historyserver-01/tmp/mapred \
  ${KBD_DATA_DIR}/myql-node-01/data \
  ${KBD_DATA_DIR}/hive-node-01/logs/hadoop \
  ${KBD_DATA_DIR}/hive-node-01/tmp/hive_temp

init:
	for dir in ${dirs} ; do \
		mkdir -p $$dir ; \
		chmod 777 $$dir ; \
	done
