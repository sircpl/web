# web

Project for my personal website

## nginx

Find how a running instance of nginx is configured:

```
nginx -V
```

Reload the nginx configuration after a change:

```
nginx -s reload
```

## Docker

Create a debian docker container to play around in locally:

```
docker login --username=<username>
docker pull debian:latest
docker create -t -i debian:latest bash # -t = allocate pseudo-TTY, -i = interactive
docker ps -a # List all containers
docker start -a -i <container_id> # -a = attach, -i = interactive
apt-get update # need to get packages first
apt-get install -y sudo
sudo apt-get install -y gnulib
apt-get upgrade -y
apt-get install -y procps # Apparently ps isn't installed by default?
apt-get install -y nginx
nginx
apt-get install -y curl
curl localhost
```

## Build and Run Website

```
docker build . -t scpl.xyz
docker run -p 8080:80 <image_id>
```

## Attach to Running Webserver

```
docker exec -i -t <container_id> /bin/bash
```

## Dependencies

nginx - a web server
