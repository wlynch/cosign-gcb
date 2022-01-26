#!/bin/bash

go env
export KO_DOCKER_REPO="gcr.io/wlynch-test"
IMAGE=$(ko publish .)

gcloud auth list 

go install github.com/sigstore/cosign/cmd/cosign@21e6b806143652331b77c29c62a131fb33a71ae0
COSIGN_EXPERIMENTAL=1 $(go env GOPATH)/bin/cosign sign --force --identity-token=$(gcloud auth print-identity-token --audiences=sigstore) ${IMAGE}
