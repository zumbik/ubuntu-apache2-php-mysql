FROM ubuntu:latest
MAINTAINER zumbik

RUN apt upgrade && apt -y install apache2 php php-mysql && apt clean all

# Simple startup script to avoid some issues observed with container restart
ADD start-httpd.sh /start-httpd.sh
RUN chmod -v +x /start-httpd.sh

EXPOSE 80

CMD ["/start-httpd.sh"]
