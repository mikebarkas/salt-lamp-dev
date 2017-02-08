php:
  '7.0':
    xdebug:
      file: /etc/php/7.0/apache2/conf.d/xdebug.conf.ini
      source: salt://php70/files/xdebug.conf.ini
    packages:
      - php7.0
      - php7.0-cli
      - php7.0-gd
      - php7.0-json
      - php7.0-mysql
      - php7.0-curl
      - php-xdebug
      - php7.0-xml
      - php7.0-mbstring
