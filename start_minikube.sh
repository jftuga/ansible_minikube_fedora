#!/bin/bash

# References:
# https://minikube.sigs.k8s.io/docs/start/

minikube config set memory 1800
minikube delete
minikube start || exit 1
kubectl get po -A || exit 1
minikube status

