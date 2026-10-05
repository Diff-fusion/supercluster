#!/usr/bin/env bash

set -e

# loading the image with minikube is somehow a lot slower
docker image load -i /home/ctf/.minikube/cache/kic/amd64/kicbase_v0.0.46@sha256_fd2d445ddcc33ebc5c6b68a17e6219ea207ce63c005095ea1525296da2d1a279.tar
