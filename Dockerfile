FROM confluentinc/ksqldb-server:0.29.0
RUN 'chmod -R 777 /etc/ksqldb/'
RUN 'chmod 777 /usr/logs/ksql-server-gc.log'
