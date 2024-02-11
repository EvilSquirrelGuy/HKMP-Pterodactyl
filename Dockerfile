FROM alpine:3.18.4
LABEL maintainer="EvilSquirrelGuy"

RUN apk add --no-cache --update \
  --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ mono bash curl screen unzip \
  && adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY hkmp /bin/hkmp
COPY start.sh /start.sh

ENTRYPOINT ["/start.sh"]
