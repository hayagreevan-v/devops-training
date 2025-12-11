# FROM php:8.2-apache

# # Install mysqli + pdo_mysql
# RUN docker-php-ext-install mysqli pdo pdo_mysql

# # Enable Apache rewrite (optional)
# RUN a2enmod rewrite
FROM ubuntu 
RUN apt update
RUN apt install -y apache2
RUN apt install -y mysql-client-core-8.0 
RUN apt install -y php-common libapache2-mod-php php-cli php-mysql


CMD ["apachectl", "-D", "FOREGROUND"]
