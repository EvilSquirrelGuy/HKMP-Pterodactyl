FROM alpine:3.16.2
LABEL maintainer="Maxim Makeev <maximalmax90@mail.ru>"

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ mono bash curl screen unzip

RUN mkdir /HKMP
RUN mkdir /FILES
RUN LATEST=$(curl -s https://api.github.com/repos/Extremelyd1/HKMP/releases | grep tag | grep html_url | awk -F\" '{print $4}' | awk -Ftag\/ '{print $2}' | head -n 1); \
    curl -sOL https://github.com/Extremelyd1/HKMP/releases/download/$LATEST/HKMPServer.zip
RUN unzip -o HKMPServer.zip -d /FILES
WORKDIR /HKMP
COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
EXPOSE 2222/udp
