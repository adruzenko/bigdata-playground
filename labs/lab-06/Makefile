KBD_DATA_DIR ?= ../.kbd

dirs= \
  ${KBD_DATA_DIR}/solr-node-01/data
init:
	for dir in ${dirs} ; do \
		mkdir -p $$dir ; \
		chmod 777 $$dir ; \
	done
