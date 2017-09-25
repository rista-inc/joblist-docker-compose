FROM elasticsearch:5-alpine

RUN bin/elasticsearch-plugin install analysis-kuromoji
RUN bin/elasticsearch-plugin install analysis-icu

ENV ES_JAVA_OPTS "-Xms1g -Xmx1g"
