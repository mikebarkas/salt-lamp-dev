{% set db1_ip='192.168.10.20' %}

mysql:
  server:
    bind_address: {{ db1_ip }}
    config_file: salt://mariadb/files/my.cnf
    datadir: /var/lib/mysql
  databases:
    - project_one
    - project_two
  user:
    name: developer
    host: '192.168.10.%'
    pass: developer
    privileges: all privileges
    db_name: project_one

