FROM openjdk:8-jre

RUN apt-get update && apt-get install -y libpostgresql-jdbc-java procps libsasl2-modules libsasl2-dev && rm -rf /var/lib/apt/lists/*

# Install Apache Hadoop
ENV HADOOP_VERSION=3.1.2
ENV HADOOP_HOME /opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=$HADOOP_HOME/conf
ENV PATH $PATH:$HADOOP_HOME/bin
RUN curl -L \
  "https://archive.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz" \
    | tar xvfz - -C /opt/ \
  && rm -rf $HADOOP_HOME/share/doc \
  && chown -R root:root $HADOOP_HOME \
  && mkdir -p $HADOOP_HOME/logs \
  && mkdir -p $HADOOP_CONF_DIR \
  && chmod 777 $HADOOP_CONF_DIR \
  && chmod 777 $HADOOP_HOME/logs

# Install Apache Hive
ENV HIVE_VERSION=3.1.2
ENV HIVE_HOME=/opt/apache-hive-$HIVE_VERSION-bin
ENV HIVE_CONF_DIR=$HIVE_HOME/conf
ENV PATH $PATH:$HIVE_HOME/bin
RUN curl -L \
  "https://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz" \
    | tar xvfz - -C /opt/ \
  && chown -R root:root $HIVE_HOME \
  && mkdir -p $HIVE_HOME/hcatalog/var/log \
  && mkdir -p $HIVE_HOME/var/log \
  && mkdir -p /data/hive/ \
  && mkdir -p $HIVE_CONF_DIR \
  && chmod 777 $HIVE_HOME/hcatalog/var/log \
  && chmod 777 $HIVE_HOME/var/log

RUN curl -L \
        "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk/1.11.624/aws-java-sdk-1.11.624.jar" \
        --output $HIVE_HOME/lib/aws-java-sdk-1.11.624.jar \
    && curl -L \
        "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-core/1.11.624/aws-java-sdk-core-1.11.624.jar" \
        --output $HIVE_HOME/lib/aws-java-sdk-core-1.11.624.jar \
    && curl -L \
        "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-s3/1.11.624/aws-java-sdk-s3-1.11.624.jar" \
        --output $HIVE_HOME/lib/aws-java-sdk-s3-1.11.624.jar \
    && curl -L \
        "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-dynamodb/1.11.624/aws-java-sdk-dynamodb-1.11.624.jar" \
        --output $HIVE_HOME/lib/aws-java-sdk-dynamodb-1.11.624.jar \
    && curl -L \
        "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/$HADOOP_VERSION/hadoop-aws-$HADOOP_VERSION.jar" \
        --output $HIVE_HOME/lib/hadoop-aws-$HADOOP_VERSION.jar

# Configure
ADD files/hive-site.xml $HIVE_CONF_DIR/

ADD files/init-hive.sh /
RUN chmod +x /init-hive.sh

EXPOSE 9083
EXPOSE 10000
EXPOSE 10002