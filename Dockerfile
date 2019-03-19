FROM php:7.3.3-apache-stretch

RUN apt-get update && apt-get install -y \
        $PHPIZE_DEPS \
        libcurl3 \
        libmagickwand-dev
RUN apt-get install -y \
        libmagickcore-dev
RUN apt-get install -y \
        libtool 
RUN apt-get install -y \
        libxml2-dev 
RUN apt-get install -y \
        libpq-dev 
RUN apt-get install -y \
        curl 
RUN apt-get install -y \
        git 
RUN apt-get install -y \
        imagemagick 
RUN apt-get install -y \
        libicu57 
RUN apt-get install -y curl
RUN pecl install imagick \
    && docker-php-ext-enable imagick

RUN apt-get install -y \
        zlib1g-dev \
        libcurl4-gnutls-dev \
        libzip-dev \
        zip 

RUN docker-php-ext-install \
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

COPY install-node.sh /
RUN sh /install-node.sh
