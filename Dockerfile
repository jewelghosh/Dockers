FROM ubuntu:16.04

LABEL company="Java Home Cloud" \
      maintainer="Hari" \
      Location="Banglore" \
      Version="0.0.1"

RUN apt-get update -y
# httpd is the package name for apache in Linux
# apache2 is the package name for apache in Ubuntu
RUN apt-get install apache2 -y
RUN apt-get install wget -y
RUN apt-get install unzip -y 
# Copy the static website to Apache deployment directory(/var/www/html)
WORKDIR /tmp

RUN wget https://github.com/R-Sateesh/docker/archive/refs/heads/master.zip

RUN unzip master.zip 

RUN mv -r javahome-app-master/* /var/www/html

EXPOSE 80
# CMD is runtime instruction, is excuted when we run container
CMD ["apachectl","-D", "FOREGROUND"]
