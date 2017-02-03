mariadb-server:
 pkg.installed: [] 
 service.running:
  - name: mysql
  - enable: True
  - reload: True
