FROM php:8.2-apache

# Install dependencies
RUN apt-get update && \
    apt-get install -y libxslt1-dev xsltproc && \
    docker-php-ext-install xsl && \
    rm -rf /var/lib/apt/lists/*


RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN a2enmod rewrite

# Enable CORS
RUN a2enmod headers
RUN sed -ri -e 's/^([ \t]*)(<\/VirtualHost>)/\1\tHeader set Access-Control-Allow-Origin "*"\n\1\2/g' /etc/apache2/sites-available/*.conf

RUN service apache2 restart

COPY logging.ini /usr/local/etc/php/conf.d/logging.ini
COPY . /var/www/html/



EXPOSE 80

WORKDIR /usr/src/myapp
