update-os:
  cmd.run:
    - name: sudo apt-get update -y


php53:
  pkg.installed:
    - pkgs:
{% for pkg in pillar['php']['5.3']['packages'] %}
      - {{ pkg }}
{% endfor %}
    - require:
      - cmd: update-os


{{ pillar['php']['5.3']['xdebug']['file'] }}:
  file.managed:
    - source: {{ pillar['php']['5.3']['xdebug']['source'] }}
    - require:
      - pkg: php53

