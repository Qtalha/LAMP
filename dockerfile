ARG version=focal
FROM ubuntu:${version}
ARG DEBIAN_FRONTEND=noninteractive
LABEL maintainer="shahbaazimamkhan"
LABEL version=1.0
LABEL appname=LAMP
RUN apt update && \
    apt install apache2 -y && \
    apt install ufw -y && \
    ufw allow in "Apache"
RUN mkdir /var/www/instinct && \
    sudo chown -R $USER:$USER /var/www/instinct
COPY ./index.html /var/www/instinct/
COPY ./apache2.conf /etc/apache2/
COPY ./instinct.conf /etc/apache2/sites-available/
RUN a2ensite instinct && service apache2 restart
RUN apt install mysql-server -y && \
    apt install php -y && \
    apt install libapache2-mod-php -y
EXPOSE 34000
COPY ./file.sh /root/
RUN chmod 777 /root/file.sh
CMD ["/bin/bash", "/root/file.sh" ]
