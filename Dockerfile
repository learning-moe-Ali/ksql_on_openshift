FROM confluentinc/ksqldb-server:0.29.0
ARG KSQL_BOOTSTRAP_SERVERS=dev-kafka-cluster-kafka-bootstrap:9092
ARG KSQL_LISTENERS=http://0.0.0.0:8088/
ARG KSQL_KSQL_SERVICE_ID=ksqldb_
ARG KSQL_KSQL_SCHEMA_REGISTRY_URL=http://dev-kafka-apicurioregistry-kafkasql-service.dev-kafka.svc.cluster.local:8080/apis/registry/v2
ARG KSQL_KSQL_LOGGING_PROCESSING_STREAM_AUTO_CREATE=true
ARG KSQL_KSQL_LOGGING_PROCESSING_TOPIC_AUTO_CREATE=true
RUN '/usr/bin/docker/run'
RUN 'chmod -R 777 /etc/ksqldb/'
RUN 'chmod 777 /usr/logs/ksql-server-gc.log'
