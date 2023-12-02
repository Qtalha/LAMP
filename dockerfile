FROM ubuntu:23.10
LABEL maintainer="shahbaazimamkhan"
LABEL version=1.0
LABEL appname=LAMP
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && \
    apt install apache2 -y && \
    mkdir /var/www/instinct && \
    chown -R $USER:$USER /var/www/instinct
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf && \
    apache2ctl configtest && \
    a2dissite 000-default
COPY instinct.conf /etc/apache2/sites-available/
COPY index.html /var/www/instinct/
RUN a2ensite instinct.conf && \
    a2dissite 000-default && \
    rm /etc/apache2/sites-available/000-default.conf
COPY dir.conf /etc/apache2/mods-enabled/
RUN apt install -y php libapache2-mod-php
COPY info.php /var/www/instinct/
CMD /usr/sbin/apache2ctl -D FOREGROUND
EXPOSE 80
