FROM confluentinc/ksqldb-server:0.29.0
USER root

# target directory must be one of the projects that ksql-run-class sets on the KSQL_CLASSPATH,
# of which the artifact ID (ksqldb-docker) is not one. thus the workaround of using ksqldb-rest-app
ADD --chown=appuser:appuser target/${ARTIFACT_ID}-${PROJECT_VERSION}-package/share/java/${ARTIFACT_ID}/* /usr/share/java/ksqldb-rest-app/
ADD --chown=appuser:appuser target/${ARTIFACT_ID}-${PROJECT_VERSION}-package/bin/* /usr/bin/
ADD --chown=appuser:appuser target/${ARTIFACT_ID}-${PROJECT_VERSION}-package/bin/docker/* /usr/bin/docker/
ADD --chown=appuser:appuser target/${ARTIFACT_ID}-${PROJECT_VERSION}-package/etc/* /etc/ksqldb/
ADD --chown=appuser:appuser target/${ARTIFACT_ID}-${PROJECT_VERSION}-package/share/doc/* /usr/share/doc/${ARTIFACT_ID}/

RUN echo "===> Installing confluent-hub..." \
    && wget http://client.hub.confluent.io/confluent-hub-client-latest.tar.gz \
    && tar xf confluent-hub-client-latest.tar.gz \
    && rm confluent-hub-client-latest.tar.gz

RUN chmod +x /usr/bin/docker/configure
RUN chmod +x /usr/bin/docker/run

RUN 'chmod -R 777 /etc/ksqldb/'
RUN 'chmod 777 /usr/logs/ksql-server-gc.log'

USER appuser

CMD ["/usr/bin/docker/run"]
