base:
  '*':
    - config

  'db*':
    - mysql

  'web*':
    - php
    - apache
