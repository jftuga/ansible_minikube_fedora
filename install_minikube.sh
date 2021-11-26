#!/bin/bash

# References:
# https://minikube.sigs.k8s.io/docs/start/
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/


# minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 || exit 1
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64.sha256 || exit 1
echo "$(<minikube-linux-amd64.sha256) minikube-linux-amd64" | sha256sum --check || exit 1
install -o root -g root -m 0755 minikube-linux-amd64 /usr/local/bin/minikube || exit 1
minikube version || exit 1


# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" || exit 1
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" || exit 1
echo "$(<kubectl.sha256) kubectl" | sha256sum --check || exit 1
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl || exit 1
kubectl version --client || exit 1

# clean up
rm -f /root/minikube-linux-amd64 /root/minikube-linux-amd64.sha256 /root/kubectl /root/kubectl.sha256
