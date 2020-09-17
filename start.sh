#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
PINK='\033[0;35m'
cat manifests/* | envsubst '$APP_NAME $NAMESPACE $RESIOT_NODES' > expanded.yaml
if [ $? != 0 ]; then printf "Creating ${PINK}expanded.yaml${NC} - ${RED}Failed${NC}\n\n"; else printf "Creating ${PINK}expanded.yaml${NC} - ${GREEN}Success${NC}\n\n"; fi
kubectl create configmap $APP_NAME-conf -n $NAMESPACE --from-file=configs/
if [ $? != 0 ]; then printf "Creating ${PINK}ConfigMap${NC} object - ${RED}Failed${NC}\n\n"; else printf "Creating ${PINK}ConfigMap${NC} object - ${GREEN}Success${NC}\n\n"; fi
kubectl create -f expanded.yaml
if [ $? != 0 ]; then printf "${PINK}Deployment${NC} - ${RED}Failed${NC}\n\n"; else printf "${PINK}Deployment${NC} - ${GREEN}Success${NC}\n\n"; fi
