# The official Elasticsearch Docker image
FROM docker.elastic.co/elasticsearch/elasticsearch:8.13.0sha256:75e68e06b38a052807a4be91761325c6e054052a50088cd5eea7e155bc4802ab

# Copy our config file over
COPY --chown=1000:0 config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

# Allow Elasticsearch to create `elasticsearch.keystore`
# to circumvent https://github.com/elastic/ansible-elasticsearch/issues/430
RUN chmod g+ws /usr/share/elasticsearch/config

USER 1000:0
