FROM php:8.2-apache

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN a2enmod rewrite
RUN service apache2 restart

# Copy the Blazegraph setup from the previous stage
COPY . /var/www/html/

EXPOSE 80

WORKDIR /usr/src/myapp
