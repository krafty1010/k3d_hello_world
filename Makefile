SHELL := /bin/bash -o pipefail
KUBECTL := kubectl --context k3d-mycluster

.PHONY: create-k3d-cluster
.PHONY: delete-k3d-cluster
.DEFAULT_GOAL := deploy

create-k3d-cluster: delete-k3d-cluster
	@which k3d >> /dev/null || echo "k3d must be installed\n==> visit https://k3d.io/ \n\n wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash" \
	&& k3d cluster create mycluster --api-port 6550 -p "8888:80@loadbalancer" --agents 2 && echo "kubernetes cluster available using k3d-cluster context" 

delete-k3d-cluster:
	@echo "Deleting existing Kubernetes cluster..." && k3d cluster delete mycluster

build:
	@echo "Building docker image..." && docker build -t myapp:1.1 ./myapp

import:
	@echo "importing docker image..." && k3d image import myapp:1.1 --cluster mycluster

apply:
	@echo "applying manifests..." && ${KUBECTL} apply -f ./manifests 

deploy: build create-k3d-cluster import apply

