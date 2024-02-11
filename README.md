# HKMP Pterodactyl Docker Image
Standalone server provided by [Extremelyd1](https://github.com/Extremelyd1/HKMP).
Original docker container provided by [maximalmax90](https://github.com/maximalmax90/HKMPDocker)

~~Dockerhub Repo: https://hub.docker.com/repository/docker/maximalmax90/hkmpserver~~

Note: the latest tag allows you to update server files without recreating the container. Or you can use pre-build container with specific version (example: ```maximalmax90/hkmpserver:v2.2.3```)

You need to bind directory to container, if you want to edit and store settings in json-files.

Now you can manage the server through the hkmp command:
- Stop server: ```hkmp exit```
- Check for update: ```hkmp check```
- Update server: ```hkmp update```
- Post command to server console: ```hkmp <command> [args]``` full list of commands available [here](https://github.com/Extremelyd1/HKMP#usage)

## Example
```docker run -d -it --name hkserver -e PORT=2222 -p 2222:2222/udp -v /localdir/:/HKMP/ maximalmax90/hkmpserver:latest```

## Composer
```
version: "2.1"
services:  
  hkserver:
    image: maximalmax90/hkmpserver:latest
    container_name: hkserver
    environment:
     - PORT=2222 #if you need running server on custom port, PORT=2222 if variable PORT is empty
    volumes:
      - /localdir:/HKMP
    ports:
      - "2222:2222/udp"
    restart: always
```
