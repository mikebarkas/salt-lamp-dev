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
    - require:
      - cmd: update-ppa


php56:
  pkg.installed:
    - pkgs:
{% for pkg in pillar['php']['5.6']['packages'] %}
      - {{ pkg }}
{% endfor %}
    - require:
      - cmd: update-os


{{ pillar['php']['5.6']['xdebug']['file'] }}:
  file.managed:
    - source: {{ pillar['php']['5.6']['xdebug']['source'] }}
    - require:
      - pkg: php56
