# Base-Image
FROM php:8.2-fpm

# Install Packages
RUN apt-get update && apt-get install -y \
    nginx \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli zip opcache

#  Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Nginx Config
COPY nginx.conf /etc/nginx/nginx.conf

# WordPress
WORKDIR /var/www/html
RUN curl -O https://wordpress.org/latest.tar.gz \
    && tar -zxvf latest.tar.gz \
    && rm latest.tar.gz \
    && chown -R www-data:www-data wordpress

# Starting Script
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Port
EXPOSE 80

# Start
CMD ["/usr/local/bin/start.sh"]
