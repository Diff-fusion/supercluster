#!/bin/sh
target="superclusters.tar.gz"
tar -c -a -f "$target" images superclusters
sha256=$(sha256sum "$target" | cut -f1 -d' ')
echo "Copy to static file host:"
echo "kubectl cp -n platform $target ctf-platform-static-files-0:/static-files/$sha256"
