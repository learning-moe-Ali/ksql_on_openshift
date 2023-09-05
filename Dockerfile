FROM confluentinc/ksqldb-server:0.29.0
RUN 'usermod -aG appuser 1000770000'
CMD [ "/usr/bin/docker/run" ]
