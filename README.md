# web

##Notes

## nginx

Adding this section to the nginx configuration will route requests to the uWSGI server using a unix socket.

```
location /web {                                                                                                           
    uwsgi_pass unix:///tmp/web-uwsgi.sock;                                                                                
    include uwsgi_params;                                                                                                 
}
```

Find how a running instance of nginx is configured:

```
nginx -V
```

Reload the nginx configuration after a change:

```
nginx -s reload
```

View top for uwsgi workers:

```
uwsgitop 127.0.0.1:9191
```

## Debian

Update your system:

```
sudo apt-get update
sudo apt-get upgrade
```

Search for packages:

```
apt-cache search <package>
```

Install nginx:

```
sudo apt-get install nginx
```

Reload nginx config:

```
sudo nginx -s reload
```

## Deployment Sequence

```
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install nginx
# Download source files from S3
# Update nginx configuration
# Copy source files to appropriate location
sudo mkdir /var/www/scpl.xyz
sudo ln -s /etc/nginx/sites-available/scpl.xyz /etc/nginx/sites-enabled/scpl.xyz
sudo nginx -s reload
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

uWSGI - an application server that implements WSGI
nginx - a web server

## Glossary

WSGI - Web Server Gateway Interface. Defines a common interface between web servers (e.g. nginx) and python web applications/frameworks (e.g. Django). Defined in PEP 3333
