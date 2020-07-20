#!/usr/bin/env bash
export KUBECONFIG="${KUBECONFIG}"

LOGDNA_AGENT_DS_YAML="https://assets.${REGION}.logging.cloud.ibm.com/clients/logdna-agent-ds.yaml"

echo "*** Creating logdna-agent-key secret"
kubectl create secret generic logdna-agent-key --from-literal=logdna-agent-key="${LOGDNA_AGENT_KEY}"

echo "*** Creating logdna-agent daemon set"
kubectl create -f "https://assets.${REGION}.logging.cloud.ibm.com/clients/logdna-agent-ds.yaml"