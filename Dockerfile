FROM alpine:3.16.2
LABEL maintainer="Maxim Makeev <maximalmax90@mail.ru>"

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ mono bash curl screen unzip

RUN mkdir /HKMP
RUN mkdir /FILES
WORKDIR /HKMP
COPY hkmp /bin/hkmp
COPY start.sh /start.sh

ENTRYPOINT ["/start.sh"]
