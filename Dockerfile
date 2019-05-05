FROM debian:latest
SHELL ["/bin/bash", "-c"]
RUN apt-get update
RUN apt-get install -y sudo
RUN sudo apt-get upgrade -y
RUN sudo apt-get install -y procps
RUN sudo apt-get install -y nginx
RUN sudo apt-get install -y vim
RUN sudo apt-get install -y curl
COPY nginx /etc/nginx/
COPY scpl.xyz /var/www/scpl.xyz/
RUN sudo ln -s /etc/nginx/sites-available/scpl.xyz /etc/nginx/sites-enabled/scpl.xyz
RUN sudo unlink /etc/nginx/sites-enabled/default
ENTRYPOINT ["nginx", "-g", "daemon off;"]
