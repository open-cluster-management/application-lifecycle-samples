#!/bin/bash

CLUSTER_NUM=1
CLUSTER_TOTAL=1000
OUTPUT_DIR=_output

# Clean up
rm -fr ${OUTPUT_DIR}
mkdir -p ${OUTPUT_DIR}/

while [ $CLUSTER_NUM -le $CLUSTER_TOTAL ]; do
    CLUSTER_NAME="cluster-${CLUSTER_NUM}"

    cat cluster-tpl.yaml | sed -e "s/\<CLUSTER\>/${CLUSTER_NAME}/g" >> ${OUTPUT_DIR}/managedclusters.yaml
    (( CLUSTER_NUM = CLUSTER_NUM + 1 ))
done
