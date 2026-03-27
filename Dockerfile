FROM php:8.2-fpm

# Install dependencies sistem
RUN apt-get update && apt-get install -y \
    libpq-dev \
    zip \
    unzip \
    git \
    curl

# Install ekstensi PHP untuk Postgres
RUN docker-php-ext-install pdo pdo_pgsql

# Ambil Composer terbaru
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www