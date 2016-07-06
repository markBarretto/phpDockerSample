FROM ubuntu:14.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y apache2
RUN apt-get install -y php5 
RUN apt-get install -y libapache2-mod-php5
RUN apt-get install -y php5-mcrypt 
RUN apt-get install -y php5-mysql
RUN apt-get install -y libapache2-mod-auth-mysql
RUN a2enmod auth_mysql

RUN mkdir /www
ADD . /www
WORKDIR /www

RUN rm /var/www/html/*
COPY www /var/www/html

RUN chown www-data:www-data -R /www
RUN chown www-data:www-data -R /var/www

#COPY php.ini /usr/local/etc/php/php.ini

COPY apache-config.conf /etc/apache2/sites-enabled/apache-config.conf

EXPOSE 80

CMD ["apache2ctl","-D","FOREGROUND"]