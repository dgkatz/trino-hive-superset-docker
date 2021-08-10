# Cloud-native Trino (prestosql) + Hive + Minio + Superset
## Technologies:
### Query Engine is `Trino (PrestoSQL)`
### Metadata Store is `Apache Hive`
### Object Storage is `Minio (S3 compatable)`
### Data Viz is `Apache Superset`

## Get things running
1. Clone repo
2. Install docker + docker-compose
3. Run `docker-compose --compatibility up`
4. Run `bash bootstrap-superset.sh`
4. Done! Checkout the service endpoints:

Trino: `http://localhost:8080/ui/` (username can be anything) <br>
Minio: `http://localhost:9001/` (username: `minio_access_key`, password: `minio_secret_key`)<br>
Superset: `http://localhost:8088/` (username: `admin`, password: `admin`)<br>

## Connect to Trino in Superset:
1. Go to `data` dropdown and click `databases`
2. Click the `+ database` button
3. For `Select a database to connect` choose `presto`
4. In `SQLALCHEMY URI` put `trino://hive@trino-coordinator:8080/hive`
5. Switch over to `Advanced` tab
5. In `SQL Lab` select all options
5. In `Security` select `Allow data upload`

 
