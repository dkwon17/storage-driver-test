#!/bin/bash
set -x
# This script pushes the provided image to the OpenShift internal registry
# Usage: upload_to_internal_registry.sh <image>

if [ -z "$1" ]; then
  echo "Usage: upload_to_internal_registry.sh <image>"
  exit 1
fi

oc patch configs.imageregistry.operator.openshift.io/cluster --patch '{"spec":{"defaultRoute":true}}' --type=merge
REGISTRY="$(oc get route/default-route -n openshift-image-registry -o=jsonpath='{.spec.host}')/openshift"

SLASHES=$(echo $1 | grep -o "/" | wc -l)
NEW_IMAGE=${REGISTRY}/$(echo $1 | cut -d '/' -f $(($SLASHES + 1)))
podman tag $1 $NEW_IMAGE
podman login --tls-verify=false -u unused -p $(oc whoami -t)  ${REGISTRY}
podman push --tls-verify=false $NEW_IMAGE
