ARG version=focal
FROM ubuntu:${version}
ARG debian=${apt install}
ARG DEBIAN_FRONTEND=noninteractive
LABEL maintainer="shahbaazimamkhan"
LABEL version=1.0
LABEL appname=LAMP
ENTRYPOINT [ "executable" ]
RUN apt get update && \
    ${debian} apache2 -y && \
    ${debian} mysql-server -y && \
    ${debian} php -y && \
    ${debian} libapache2-mod-php -y && \
COPY ./file.sh /root/
RUN chmod 777 /root/file.sh
CMD /root/file.sh