#!/bin/bash
# Install minikube and addons
rm -r ~/.minikube
minikube start --memory=8192mb --cpus=4
minikube addons enable metrics-server
# Install Vault
kubectl apply -f namespace.yaml
helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo update
helm install vault hashicorp/vault --namespace vault --version 0.27.0 --set "server.dev.enabled=true" --set "ui = true"
minikube service vault -n vault
# export VAULT_TOKEN=root
# export VAULT_ADDR=http://127.0.0.1:63066
