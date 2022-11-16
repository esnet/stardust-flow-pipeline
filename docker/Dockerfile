FROM docker.elastic.co/logstash/logstash:8.2.2

#Create symlink so can use paths from production with logstash docker defaults
USER root
RUN mkdir -p /etc/logstash && \
    rm -rf /usr/share/logstash/pipeline/* && \
    ln -s /usr/share/logstash/pipeline /etc/logstash/conf.d

COPY --chown=logstash:root conf /usr/share/logstash/config 
COPY --chown=logstash:root ruby /usr/lib/stardust/pipeline/ruby
COPY --chown=logstash:root pipeline /usr/share/logstash/pipeline/
COPY --chown=logstash:root pipeline_etc /etc/stardust/pipeline/
COPY --chown=logstash:root logstash-filter-geoip /etc/stardust/logstash-filter-geoip/

VOLUME /usr/share/logstash/pipeline/
VOLUME /usr/lib/stardust/pipeline/ruby
VOLUME /usr/share/logstash/config 
VOLUME /etc/stardust/pipeline/certificates

USER logstash

VOLUME /usr/share/logstash/config
