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
