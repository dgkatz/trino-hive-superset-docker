# Cloud-native Lakehouse    kafka + spark + Deltalake + Trino (prestosql) + Hive + Minio + Superset
### Technologies:
#### apache kafka
#### apache spark
#### apache deltalake
#### Query Engine is `Trino (PrestoSQL)`
#### Metadata Store is `Apache Hive`
#### Object Storage is `Minio (S3 compatable)`
#### Data Viz is `Apache Superset`

![image](https://user-images.githubusercontent.com/5821916/143058563-97afbd4f-651d-4290-b2e2-ed3dfb38d4ae.png)


## Get things running
1. Clone repo
2. Install docker + docker-compose
3. Run `docker-compose --compatibility up`
4. Run `bash boot.sh`
5. Checkout the service endpoints:

Trino: `http://localhost:8080/ui/` (username can be anything) <br>
Minio: `http://localhost:9001/` (username: `minio_access_key`, password: `minio_secret_key`)<br>
Superset: `http://localhost:8088/` (username: `admin`, password: `admin`)<br>
kafka: `http://localhost:9021/ ` <br>
spark: `http://localhost:9999 ` (get key: docker-compose exec pyspark bash -c "jupyter server list")
## Kafka connect - stream data from mysql to minio:
1. create S3 bucket: minio-sink-bucket (minio) 
2. create kafka connectors:
##### Start S3 minio connector
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @s3-minio-sink.json
##### Start MySQL connector
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @source.json
## Spark - transform data to deltalake format:
1. log into spark 
2. execute notebook
## Hive - create delta hive tables:
1. docker-compose exec hive hive
2. docker-compose exec hive hive -e 'create database amithive;'
3. docker-compose exec hive hive -e "$(cat hive_command.hql)"
## Connect to Trino in Superset:
1. Go to `data` dropdown and click `databases`
2. Click the `+ database` button
3. For `Select a database to connect` choose `presto`
4. In `SQLALCHEMY URI` put `trino://hive@trino-coordinator:8080/hive`
5. Switch over to `Advanced` tab
5. In `SQL Lab` select all options
5. In `Security` select `Allow data upload`

 
# kafka-deltalake-trino-superset
