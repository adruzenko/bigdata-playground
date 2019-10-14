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
  ${KBD_DATA_DIR}/hive-node-01/tmp/hive_temp \
  ${KBD_DATA_DIR}/hive-server-01/logs/hadoop \
  ${KBD_DATA_DIR}/hive-server-01/tmp/hive_temp \
  ${KBD_DATA_DIR}/nifi-node-01/flow \
  ${KBD_DATA_DIR}/nifi-node-01/flow_archive \
  ${KBD_DATA_DIR}/nifi-node-01/templates \
  ${KBD_DATA_DIR}/nifi-node-01/logs \
  ${KBD_DATA_DIR}/nifi-node-01/database_repository \
  ${KBD_DATA_DIR}/nifi-node-01/flowfile_repository \
  ${KBD_DATA_DIR}/nifi-node-01/content_repository \
  ${KBD_DATA_DIR}/nifi-node-01/provenance_repository \
  ${KBD_DATA_DIR}/nifi-node-01/state \
  ${KBD_DATA_DIR}/nifi-node-01/work
init:
	for dir in ${dirs} ; do \
		mkdir -p $$dir ; \
		chmod 777 $$dir ; \
	done
