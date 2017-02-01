apache2:
  pkg:
    - installed


/var/www/html/index.php:
  file:
    - managed
    - source: salt://apache/files/index.php
    - require:
      - pkg: apache2
