mariadb-server:
  pkg:
    - installed
    - refresh: False
  file.managed:
    - name: /etc/mysql/my.cnf
    - source: {{ pillar['mysql']['server']['config_file'] }}
    - user: root
    - group: root
    - mode: 644
    - template: jinja
  service.running:
    - name: mysql
    - enable: True
    - require:
      - pkg: mariadb-server
    - watch:
      - file: mariadb-server


{% for db in salt['pillar.get']('mysql:databases', []) %}
create_db_{{ db }}:
  mysql_database.present:
    - name: {{ db }}
    - require:
      - service: mariadb-server
{% endfor %}


create_db_user:
  mysql_user.present:
    - name: {{ pillar['mysql']['user']['name'] }}
    - host: {{ pillar['mysql']['user']['host'] }}
    - password: {{ pillar['mysql']['user']['pass'] }}
    - require:
      - service: mariadb-server
  mysql_grants.present:
    - grant: {{ pillar['mysql']['user']['privileges'] }}
    - database: {{ pillar['mysql']['user']['db_name'] }}.*
    - user: {{ pillar['mysql']['user']['name'] }}
    - host: {{ pillar['mysql']['user']['host'] }}
    - require:
      - mysql_database: create_db_{{ pillar['mysql']['user']['db_name'] }}
      - mysql_user: create_db_user

