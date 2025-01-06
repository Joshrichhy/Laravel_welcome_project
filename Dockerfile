# Use the official PHP image with Apache (PHP 8.2 version)
FROM php:8.2-apache

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libicu-dev \
    libxml2-dev \
    libmcrypt-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql intl zip

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set working directory in container
WORKDIR /var/www/html

# Copy Laravel project files to the container
COPY . /var/www/html

# Set permissions for Laravel (ensure the correct permissions for storage/cache)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Install Composer (if not using the official image from the start)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Run Composer install to install Laravel dependencies with verbose output for debugging
RUN composer install --no-dev --optimize-autoloader -vvv

# Expose port 80
EXPOSE 80

# Apache configuration for Laravel
COPY ./config/000-default.conf /etc/apache2/sites-available/000-default.conf

# Start Apache server
CMD ["apache2-foreground"]
