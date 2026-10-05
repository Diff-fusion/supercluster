#!/usr/bin/env bash

set -e

docker pull gcr.io/k8s-minikube/kicbase:v0.0.46
docker save gcr.io/k8s-minikube/kicbase:v0.0.46 -o vm/kicbase.tar
docker pull busybox:1.37.0-uclibc
docker save busybox:1.37.0-uclibc -o vm/images/busybox.tar
docker build -t kube-ssh -f ssh/Dockerfile.ssh ssh
docker save kube-ssh -o vm/images/kube-ssh.tar
