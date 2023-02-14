ARG version=focal
FROM ubuntu:${version}
ARG DEBIAN_FRONTEND=noninteractive
LABEL maintainer="shahbaazimamkhan"
LABEL version=1.0
LABEL appname=LAMP
ENTRYPOINT [ "executable" ]
RUN apt get update && \
    apt install apache2 -y && \
    apt install mysql-server -y && \
    apt install php -y && \
    apt install libapache2-mod-php -y && \
COPY ./file.sh /root/
RUN chmod 777 /root/file.sh
CMD /root/file.sh