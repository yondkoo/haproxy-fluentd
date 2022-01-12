FROM haproxy:alpine

LABEL maintainer="Yondonrinchin <yondon898@gmail.com>"

#RUN addgroup -S yondko && adduser -S -G yondko yondko
USER root

RUN set -exo pipefail \
    && apk add --no-cache \
        rsyslog \
    && mkdir -p /etc/rsyslog.d \
    && touch /var/log/haproxy.log
    # HAProxy 1.9 or newer version doesn't need to link stdout
    #&& ln -sf /dev/stdout /var/log/haproxy.log

COPY docker-entrypoint.sh /
COPY rsyslog.conf /etc/rsyslog.d/
#COPY haproxy.cfg /etc/haproxy/haproxy.cfg

RUN chmod +x docker-entrypoint.sh
RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["-f", "/usr/local/etc/haproxy/haproxy.cfg"]
