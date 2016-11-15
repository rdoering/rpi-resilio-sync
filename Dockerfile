FROM armhf/alpine:3.4
MAINTAINER Robert Doering <rdoering.info@gmail.com>

ENV RESILIO_URL="https://download-cdn.resilio.com/stable/linux-armhf/resilio-sync_armhf.tar.gz"

RUN \
  echo " ---> Initializing and Update" \
  && apk update \
  && apk add curl \
  && apk add libc6-compat 

RUN \
  echo " ---> Installing resilio-sync from ${RESILIO_URL}" \
  && curl ${RESILIO_URL} | tar xzf - -C /usr/bin/

CMD ["echo", "Hey, it's running."]

