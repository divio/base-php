#!/bin/bash

apt-get update && apt-get install -y \
        $PHPIZE_DEPS \
        libcurl3 \
        libmagickwand-dev \
        libmagickcore-dev \
        libtool \
        libxml2-dev \
        libpq-dev \
        curl \
        git \
        imagemagick \
        libicu57 \
        curl \
        zlib1g-dev \
        libcurl4-gnutls-dev \
        libzip-dev \
        zip 

pecl install imagick \
    && docker-php-ext-enable imagick

docker-php-ext-install \
        iconv \
        mbstring \
        pdo \
        pdo_pgsql \
        pgsql \
        pcntl \
        tokenizer \
        xml \
        intl \
        zip \
        curl \
    && curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
