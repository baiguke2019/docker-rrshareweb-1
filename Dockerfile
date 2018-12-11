FROM centos:7
MAINTAINER sevtdy <sevtdy@gmail.com>

VOLUME /config /downloads

COPY file/ /

RUN set -xe \
    && chmod +x /init.sh


VOLUME /config /downloads

EXPOSE 3001

ENTRYPOINT ["/init.sh"]