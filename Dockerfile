FROM confluentinc/ksqldb-server:0.29.0
RUN chmod -R 777 /etc/ksqldb/
CMD [ "/usr/bin/docker/run" ]
