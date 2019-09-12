data_dir=.kbd
dirs= \
  ${data_dir}/zoo-node-01/data \
  ${data_dir}/zoo-node-01/datalog \
  ${data_dir}/zoo-node-01/logs \
  ${data_dir}/hdfs-namenode-01/logs \
  ${data_dir}/hdfs-namenode-01/dfs/namenode \
  ${data_dir}/hdfs-namenode-01/dfs/journalnode \
  ${data_dir}/hdfs-datanode-01/logs \
  ${data_dir}/hdfs-datanode-01/dfs/datanode \
  ${data_dir}/yarn-resourcemanager-01/logs \
  ${data_dir}/yarn-nodemanager-01/logs \
  ${data_dir}/yarn-nodemanager-01/tmp/mapred \
  ${data_dir}/mapred-historyserver-01/logs \
  ${data_dir}/mapred-historyserver-01/tmp/mapred \
  ${data_dir}/nifi-node-01/flow \
  ${data_dir}/nifi-node-01/flow_archive \
  ${data_dir}/nifi-node-01/templates \
  ${data_dir}/nifi-node-01/logs \
  ${data_dir}/nifi-node-01/database_repository \
  ${data_dir}/nifi-node-01/flowfile_repository \
  ${data_dir}/nifi-node-01/content_repository \
  ${data_dir}/nifi-node-01/provenance_repository \
  ${data_dir}/nifi-node-01/state \
  ${data_dir}/nifi-node-01/work \
  ${data_dir}/kafka-node-01/data


init:
	for dir in ${dirs} ; do \
		mkdir -p $$dir ; \
		chmod 777 $$dir ; \
	done
