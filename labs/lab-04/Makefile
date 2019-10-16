KBD_DATA_DIR ?= data
dirs= \
  ${KBD_DATA_DIR}/input \
  ${KBD_DATA_DIR}/output
init:
	for dir in ${dirs} ; do \
		mkdir -p $$dir ; \
		chmod 777 $$dir ; \
	done
