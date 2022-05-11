#!/usr/bin/env bash

CLUSTER_DOMAIN=$(oc get dns cluster -o jsonpath='{ .spec.baseDomain }')

# Create Kubernetes Secret yaml
( echo "cat <<EOF" ; cat cp4i-mq-server-certificate.yaml_template ; echo EOF ) | \
CLUSTER_DOMAIN=${CLUSTER_DOMAIN} \
sh > cp4i-mq-server-certificate.yaml