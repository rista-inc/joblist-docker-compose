FROM elasticsearch:5-alpine

RUN bin/elasticsearch-plugin install analysis-kuromoji
RUN bin/elasticsearch-plugin install analysis-icu

ADD ./src/config/elasticsearch /usr/share/elasticsearch/config
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch


ENV ES_JAVA_OPTS "-Xms1g -Xmx1g"
