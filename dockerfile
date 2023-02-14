ARG version=focal
FROM ubuntu:${version}
ARG DEBIAN_FRONTEND=noninteractive
LABEL maintainer="shahbaazimamkhan"
LABEL version=1.0
LABEL appname=LAMP
RUN apt update && \
    apt install apache2 -y
RUN apt install mysql-server -y
RUN apt install php -y && \
    apt install libapache2-mod-php -y
EXPOSE 34000
COPY ./file.sh /root/
RUN chmod 777 /root/file.sh
CMD /root/file.sh
