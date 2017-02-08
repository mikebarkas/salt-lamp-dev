common-packages:
  pkg.installed:
    - pkgs:
{% for pkg in pillar['common']['packages'] %}
      - {{ pkg }}
{% endfor %}
