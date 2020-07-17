#!/usr/bin/env bash
ibmcloud login -g ${RESOURCE_GROUP} --apikey ${APIKEY} > /dev/null


mkdir -p "${TEMP_DIR}"

CLUSTER_ID_FILE="${TEMP_DIR}/${FILE_NAME}"

if  [ $(ibmcloud ks cluster ls | grep ${CLUSTER_NAME} | wc -l) -ne 0 ]
then
  ID="$(ibmcloud ks cluster get --cluster "${CLUSTER_NAME}" --json | grep -o '"id": *"[^"]*"' | grep -o '"[^"]*"$' | grep -o '[^"].*[^"]')"
fi

printf "$ID" > "$CLUSTER_ID_FILE"
