FROM confluentinc/ksqldb-server:0.29.0
RUN 'useradd -g appuser 1000770000'
CMD [ "/usr/bin/docker/run" ]
