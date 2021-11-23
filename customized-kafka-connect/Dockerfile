FROM confluentinc/cp-kafka-connect-base:6.2.1

RUN confluent-hub install --no-prompt debezium/debezium-connector-mysql:1.4.2 
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:10.2.3
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-s3:10.0.3
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-s3-source:1.4.8
