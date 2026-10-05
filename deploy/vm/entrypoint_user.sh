#!/usr/bin/env bash

set -e

minikube start --driver=docker --kubernetes-version=v1.31.5

eval $(minikube -p minikube docker-env)

for image in /images/*; do minikube image load "$image"; done

# wait for coredns to be fully ready before deploying the challenge
kubectl wait --timeout=120s --for=condition=Ready pod -l k8s-app=kube-dns -n kube-system

kubectl create -f /deploy/minikube-0-namespace.yaml -f /deploy/minikube-1-permissions.yaml -f  /deploy/minikube-1-ssh.yaml
kubectl create configmap -n flag supercluster-html --from-file /deploy/web
kubectl create secret generic -n flag flag --from-file=/deploy/flag
kubectl create -f /deploy/minikube-2-challenge.yaml
