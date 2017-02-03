apache2:
  pkg.installed: []
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/apache2/sites-available/vhost-projects.conf
      - file: /etc/apache2/apache2.conf
    - require:
      - pkg: apache2


/var/www/html/index.php:
  file.managed:
    - source: salt://apache/files/index.php
    - require:
      - pkg: apache2


/etc/apache2/sites-available/vhost-projects.conf:
  file.managed:
    - source: salt://apache/files/vhost-projects.conf
    - require:
      - pkg: apache2
    - watch_in:
      - service: apache2


/etc/apache2/sites-enabled/vhost-projects.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/vhost-projects.conf
    - require:
      - pkg: apache2
      - file: /etc/apache2/sites-available/vhost-projects.conf
