#!/usr/bin/env bash

# You can use the following to run the d2vm command or install it yourself
# You could also download d2vm from release https://github.com/linka-cloud/d2vm?tab=readme-ov-file#from-release
# or use nix to run it `nix run nixpkgs/0203bc86fb904294f512139b92744e54dcb55383#d2vm`
# d2vm="nix run nixpkgs/0203bc86fb904294f512139b92744e54dcb55383#d2vm --"
d2vm="docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock --privileged -v $PWD:/d2vm -w /d2vm linkacloud/d2vm:latest"

# images are user readable only after docker save
chmod a+r -R vm/images/

docker build -t kube-vm -f vm/Dockerfile.vm vm
$d2vm convert kube-vm:latest -o challenge.qcow2 -p toor -v --force
docker build -t supercluster .
docker tag supercluster harbor.cscg.live/internal/challenges/supercluster/supercluster
