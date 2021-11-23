#!/bin/bash
. ./.env

docker-compose up -d

docker-compose exec pyspark bash -c "jupyter server list"
sleep 20

# Start S3 minio connector
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @s3-minio-sink.json

# Start MySQL connector
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @source.json

docker-compose exec pyspark bash -c "jupyter server list"

docker-compose exec superset superset fab create-admin --username admin --firstname Superset --lastname Admin --email admin@superset.com --password admin
docker-compose exec superset superset db upgrade
docker-compose exec superset superset init
