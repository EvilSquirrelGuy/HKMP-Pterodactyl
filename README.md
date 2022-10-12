# HKMP Docker Server
Standalone server provided by [Extremelyd1](https://github.com/Extremelyd1/HKMP).

Dockerhub Repo: https://hub.docker.com/repository/docker/maximalmax90/hkmpserver

You need to bind directory to container, if you want to edit and store settings in json-files.

## Example
```docker run -d -it --name hkserver -p 2222:2222/udp -v /localdir/:/HKMP/ maximalmax90/hkmpserver:latest```

## Composer
```
version: "2.1"
services:  
  hkserver:
    image: maximalmax90/hkmpserver:latest
    container_name: hkserver
    volumes:
      - /localdir:/HKMP
    ports:
      - "2222:2222/udp"
    restart: always
```
