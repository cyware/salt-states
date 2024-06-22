{% set user = salt['pillar.get']('cyware_user', 'cyware') %}

include:
  - cyware.config.user
  - cyware.packages.android-project-creator

cyware-config-android-project-creator-permissions:
  file.directory:
    - name: /opt/AndroidProjectCreator/library
    - makedirs: True
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - require:
      - user: cyware-user-{{ user }}
    - require:
      - sls: cyware.packages.android-project-creator