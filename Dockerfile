FROM debian:bullseye

ENV DEBIAN_FRONTEND noninteractive
ARG VOL=/var/www/html
ARG REPO_URL=https://github.com/nilsteampassnet/TeamPass.git

ENV VOL ${VOL}
VOLUME ${VOL}

ENV WEBROOT ${VOL}
ENV REPO_URL ${REPO_URL}
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN apt update && \
    apt install -y git openssl apache2 \
    php7.4-mysql php7.4-mbstring php7.4-fpm php7.4-common php7.4-xml php7.4-gd php7.4-mysql php7.4-bcmath php7.4-curl libapache2-mod-php7.4 && \
    a2enmod proxy_fcgi setenvif && \
    service apache2 restart && \
    a2enconf php7.4-fpm && \
    service apache2 reload

RUN sed -i "s/max_execution_time = 30/max_execution_time = 60/g" /etc/php/7.4/apache2/php.ini

COPY teampass-docker-start.sh /teampass-docker-start.sh

ENV REPO_URL ${REPO_URL}

WORKDIR ${VOL}

ENTRYPOINT ["/bin/sh"]
CMD ["/teampass-docker-start.sh"]
