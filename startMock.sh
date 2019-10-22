pwd
mkdir mappings
mkdir mocks
find resource -name '*.txt' | xargs -i cp {} mappings
find resource -name '*.json' | xargs -i cp {} mappings
find resource -name '*.xml' | xargs -i cp {} mappings
find stubs -name '*.txt' | xargs -i cp {} mocks
find stubs -name '*.json' | xargs -i cp {} mocks
find stubs -name '*.xml' | xargs -i cp {} mocks
/usr/local/bin/docker-compose up -d --force-recreate --build &&
exit 0
