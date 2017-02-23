FROM ubuntu:latest
MAINTAINER zumbik

RUN apt upgrade
RUN apt install -y apache2 php php-mysql
RUN apt clean all
# Simple startup script to avoid some issues observed with container restart
ADD start-httpd.sh /start-httpd.sh
RUN chmod -v +x /start-httpd.sh

EXPOSE 80

CMD ["/start-httpd.sh"]
