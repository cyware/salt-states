{% set user = salt['pillar.get']('cyware_user', 'cyware') %}

include:
  - cyware.config.user
  - cyware.packages.binee

cyware-config-binee-owner:
  file.directory:
    - name: /opt/binee-files/win10_32/windows/system32
    - makedirs: True
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - require:
      - user: cyware-user-{{ user }}
    - require:
      - sls: cyware.packages.binee