SHELL := /bin/bash -o pipefail
KUBECTL := kubectl --context k3d-mycluyster

.PHONY: create-k3d-cluster
.PHONY: delete-local-kube-cluster

create-k3d-cluster: delete-local-kube-cluster
	@which k3d >> /dev/null || echo "k3d must be installed to create local Kubernetes cluster\n==> visit https://k3d.io/ \n\n wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash" \
	&& k3d cluster create mycluster --api-port 6550 -p "8080:80@loadbalancer" --agents 2

delete-local-kube-cluster:
	@echo "Deleting existing Kubernetes cluster..." && k3d cluster delete mycluster

build-myapp:
	docker build -t myapp:local ./myapp

deploy-local-stack: build-myapp create-k3d-cluster
	k3d image import myapp:local --cluster mycluster \
	&& ${KUBECTL} apply -f ./manifests \
	&& echo "Kubernetes cluster available on Kubernetes context k3d-mycluster"