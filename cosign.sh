#!/bin/bash

go env
export KO_DOCKER_REPO="gcr.io/wlynch-test"
IMAGE=$(ko publish .)

gcloud auth list 

COSIGN_EXPERIMENTAL=1 $(go env GOPATH)/bin/cosign sign --force --k8s-keychain ${IMAGE}
