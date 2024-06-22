{% set user = salt['pillar.get']('cyware_user', 'cyware') %}

include:
  - cyware.config.user
  - cyware.python3-packages.viper-framework

cyware-config-viper-framework-virtualenv-permissions:
  file.directory:
    - name: /opt/viper
    - makedirs: False
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - recurse:
      - user
      - group
      - mode
    - require:
      - user: cyware-user-{{ user }}
    - require:
      - sls: cyware.python3-packages.viper-framework
