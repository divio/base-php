FROM php:7.3.3-apache-stretch

COPY install-php-packages.sh /
RUN sh /install-php-packages.sh

COPY install-node.sh /
RUN sh /install-node.sh

# this snippet is required by Divio Cloud for compatibility
# https://github.com/divio/divio-cli/blob/master/divio_cli/localdev/main.py#L125
COPY migrate.sh /app/migrate.sh
COPY start.sh /usr/local/bin/start
RUN chmod +x /usr/local/bin/start
RUN curl -O https://bin.equinox.io/c/ekMN3bCZFUn/forego-stable-linux-amd64.tgz
RUN tar xf forego-stable-linux-amd64.tgz
RUN mv forego /usr/local/bin/forego
