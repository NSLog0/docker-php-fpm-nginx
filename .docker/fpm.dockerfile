FROM php:7-fpm-alpine 

# Install packages and remove default server definition
RUN apk --no-cache add supervisor \ 
      curl \
      wget \
      grep \
      build-base \
      libmemcached-dev \
      libmcrypt-dev \
      libxml2-dev \
      imagemagick-dev \
      pcre-dev \
      libtool \
      make \
      autoconf \
      g++ \
      cyrus-sasl-dev \
      libgsasl-dev \
      git 

RUN docker-php-ext-install mysqli pdo pdo_mysql tokenizer xml

# # Configure PHP-FPM
ADD config/fpm-pool.conf /etc/php7/php-fpm.d/www.conf
ADD config/php.ini /etc/php7/conf.d/custom.ini

# Configure supervisord
ADD config/supervisord/php-fpm/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Setup document root
RUN mkdir -p /var/www/html

WORKDIR /var/www/html

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R nobody.nobody /var/www/html && \
  chown -R nobody.nobody /run

# Switch to use a non-root user from here on
USER nobody

EXPOSE 9000

# Let supervisord start php-fpm
CMD ["/usr/bin/supervisord","-c", "/etc/supervisor/conf.d/supervisord.conf"]
