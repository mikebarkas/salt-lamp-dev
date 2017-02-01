install-language-pack:
  cmd.run:
    - name: sudo apt-get install -y language-pack-en-base


update-ppa:
  cmd.run:
    - name: sudo LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php
    - require:
      - cmd: install-language-pack


update-os:
  cmd.run:
    - name: sudo apt-get update -y


php70:
  pkg.installed:
    - pkgs:
      - php7.0
      - php7.0-cli
      - php7.0-gd
      - php7.0-json
      - php7.0-mysql
      - php7.0-curl
      - php-xdebug
