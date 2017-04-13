apache:

{% if grains['id'] == 'web3' %}
  phpinfo_file_path: '/var/www/index.php'
{% else %}
  phpinfo_file_path: '/var/www/html/index.php'
{% endif %}

  vhosts:
    - id: web1
      server_name: domain.tld
      port: 80
      document_root: /var/www/sites
    - id: web2
      server_name: domain.tld
      port: 80
      document_root: /var/www/site
    - id: web3
      server_name: domain.tld
      port: 80
      document_root: /var/www/site
