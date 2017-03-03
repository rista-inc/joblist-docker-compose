FROM elasticsearch:2-alpine

RUN bin/plugin install analysis-kuromoji
RUN bin/plugin install analysis-icu
RUN echo "script.engine.groovy.inline.search: on" >> /usr/share/elasticsearch/config/elasticsearch.yml

