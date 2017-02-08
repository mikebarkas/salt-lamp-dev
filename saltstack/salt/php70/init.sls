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
{% for pkg in pillar['php']['7.0']['packages'] %}
      - {{ pkg }}
{% endfor %}


{{ pillar['php']['7.0']['xdebug']['file'] }}:
  file.managed:
    - source: {{ pillar['php']['7.0']['xdebug']['source'] }}
    - require:
      - pkg: php70
