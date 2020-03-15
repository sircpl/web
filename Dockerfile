FROM debian:latest
SHELL ["/bin/bash", "-c"]
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y procps && \
    apt-get install -y nginx && \
    apt-get install -y vim && \
    apt-get install -y curl
COPY nginx /etc/nginx/
COPY scpl.xyz /var/www/scpl.xyz/
RUN ln -s /etc/nginx/sites-available/scpl.xyz /etc/nginx/sites-enabled/scpl.xyz
RUN unlink /etc/nginx/sites-enabled/default
ENTRYPOINT ["nginx", "-g", "daemon off;"]
