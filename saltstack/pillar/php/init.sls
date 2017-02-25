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
  '5.6':
    xdebug:
      file: /etc/php/5.6/apache2/conf.d/xdebug.conf.ini
      source: salt://php56/files/xdebug.conf.ini
    packages:
      - php5.6
      - php5.6-cli
      - php5.6-gd
      - php5.6-json
      - php5.6-mysql
      - php5.6-curl
      - php-xdebug
      - php5.6-xml
      - php5.6-mbstring
