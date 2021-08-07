FROM apache/superset:latest
# Switching to root to install the required packages
USER root
# Example: installing the MySQL driver to connect to the metadata database
# if you prefer Postgres, you may want to use `psycopg2-binary` instead
RUN pip install mysqlclient
RUN pip install sqlalchemy-trino
# Switching back to using the `superset` user
USER superset