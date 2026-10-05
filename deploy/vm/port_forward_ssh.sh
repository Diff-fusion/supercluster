#!/usr/bin/env bash

set -e

kubectl wait --timeout=120s --for=condition=Ready pod -l app=entrypoint -n entrypoint

kubectl port-forward -n entrypoint --address 0.0.0.0 service/entrypoint 2022:
