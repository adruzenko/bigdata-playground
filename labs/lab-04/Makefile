KBD_DATA_DIR ?= ../.kbd

dirs= \
  ${KBD_DATA_DIR}/hdfs-namenode-01/logs \
  ${KBD_DATA_DIR}/hdfs-namenode-01/dfs \
  ${KBD_DATA_DIR}/hdfs-datanode-01/logs \
  ${KBD_DATA_DIR}/hdfs-datanode-01/dfs \
  ${KBD_DATA_DIR}/yarn-resourcemanager-01/logs \
  ${KBD_DATA_DIR}/yarn-nodemanager-01/logs \
  ${KBD_DATA_DIR}/yarn-nodemanager-01/tmp/mapred \
  ${KBD_DATA_DIR}/yarn-nodemanager-02/logs \
  ${KBD_DATA_DIR}/yarn-nodemanager-02/tmp/mapred \
  ${KBD_DATA_DIR}/jupyter-node-01/home \
  ${KBD_DATA_DIR}/jupyter-node-01/home/jovyan \
  ${KBD_DATA_DIR}/spark-master-01/work \
  ${KBD_DATA_DIR}/spark-master-01/tmp \
  ${KBD_DATA_DIR}/spark-master-01/logs/spark \
  ${KBD_DATA_DIR}/spark-master-01/logs/hadoop \
  ${KBD_DATA_DIR}/spark-worker-01/work \
  ${KBD_DATA_DIR}/spark-worker-01/tmp \
  ${KBD_DATA_DIR}/spark-worker-01/logs/spark \
  ${KBD_DATA_DIR}/spark-worker-01/logs/hadoop \
  ${KBD_DATA_DIR}/spark-worker-02/work \
  ${KBD_DATA_DIR}/spark-worker-02/tmp \
  ${KBD_DATA_DIR}/spark-worker-02/logs/spark \
  ${KBD_DATA_DIR}/spark-worker-02/logs/hadoop \
  ${PWD}/data/input \
  ${PWD}/data/output

init:
	for dir in ${dirs} ; do \
		mkdir -p $$dir ; \
		chmod 777 $$dir ; \
	done
