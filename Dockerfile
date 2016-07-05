FROM ubuntu
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y apache2
#RUN apt-get install php5 libapache2-mod-php5 php5-mcrypt php5-mysql
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y php5.5

RUN mkdir /www
RUN mkdir /var/www
ADD . /www
WORKDIR /www

RUN chown www-data:www-data -R /www
RUN chown www-data:www-data -R /var/www

EXPOSE 80
RUN ["apache2ctl","-D","FOREGROUND"]