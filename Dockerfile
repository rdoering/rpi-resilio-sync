FROM armhf/alpine:3.4
MAINTAINER Robert Doering <rdoering.info@gmail.com>

ENV RESILIO_URL="https://download-cdn.resilio.com/stable/linux-armhf/resilio-sync_armhf.tar.gz"

#RUN [ "cross-build-start" ]

RUN \
  echo " ---> Initializing and Update" \
  && apk update \
  && apk add curl \
  && apk add libc6-compat 

RUN \
  echo " ---> Installing resilio-sync from ${RESILIO_URL}" \
  && mkdir /rslsync \
  && mkdir /rslsync/bin \
  && mkdir /rslsync/config \
  && mkdir /rslsync/config/.sync \
  && mkdir /rslsync/log \
  && mkdir /rslsync/data \
  && curl ${RESILIO_URL} | tar xzf - -C /rslsync/bin/ \
  && ln -s /rslsync/bin/rslsync /usr/bin/rslsync

VOLUME ["/rslsync/log", "/rslsync/config", "/rslsync/data"]

EXPOSE 8888 55555

CMD ["rslsync", "--log", "/rslsync/log/rslsync.log", "--config", "/rslsync/config/rslsync.conf", "--nodaemon"]

