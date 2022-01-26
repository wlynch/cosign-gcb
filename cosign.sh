#!/bin/bash

export KO_DOCKER_REPO="gcr.io/wlynch-test"
IMAGE=$(ko publish .)

gcloud auth list 

COSIGN_EXPERIMENTAL=1 /root/go/bin/cosign sign --force --k8s-keychain ${IMAGE}
