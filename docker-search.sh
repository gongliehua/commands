#!/bin/bash

# https://registry.hub.docker.com/v1/repositories/{image}/tags
# https://registry.hub.docker.com/v2/repositories/library/{image}/tags/

if [ $# -eq 0 ]
then
    exit
fi

curl -s -S "https://registry.hub.docker.com/v1/repositories/${1}/tags" | \
sed -e 's/,/,\n/g' -e 's/\[/\[\n/g' | \
grep '"name"' | \
awk -F\" '{print $4;}' | \
sort -fu | \
sed -e "s/^/${1}:/"
