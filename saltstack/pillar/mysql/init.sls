{% set db1_ip='192.168.10.20' %}
{% set db2_ip='192.168.10.21' %}

mysql:
  server:
  {% if grains['id'] == 'db1' %}
    bind_address: {{ db1_ip }}
  {% elif grains['id'] == 'db2' %}
    bind_address: {{ db2_ip }}
  {% endif %}
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

