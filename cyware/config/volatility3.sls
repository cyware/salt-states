{% set user = salt['pillar.get']('cyware_user', 'cyware') %}

include:
  - cyware.config.user
  - cyware.python3-packages.volatility3

cyware-config-volatility3-permissions:
  file.directory:
    - name: /usr/local/lib/python3.8/dist-packages/volatility3/framework/symbols
    - makedirs: True
    - user: {{ user }}
    - group: {{ user }}
    - recurse:
        - user
        - group
    - mode: 755
    - require:
      - user: cyware-user-{{ user }}
    - watch:
      - pip: cyware-python3-packages-volatility3