#!/bin/sh
pwd
mkdir mappings
mkdir mocks
find resource -iname \*.txt -exec cp {} mappings \;
find resource -iname \*.json -exec cp {} mappings \;
find resource -iname \*.xml -exec cp {} mappings \;
find stubs -iname \*.txt -exec cp {} mocks \;
find stubs -iname \*.json -exec cp {} mocks \;
find stubs -iname \*.xml -exec cp {} mocks \;
/usr/local/bin/docker-compose up -d --force-recreate --build &&
exit 0
