{% set user = salt['pillar.get']('cyware_user', 'cyware') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user  %}
{% endif %}

include:
  - cyware.config.user

cyware-config-bash-rc:
  file.managed:
    - replace: False
    - name: {{ home }}/.bashrc
    - user: {{ user }}
    - group: {{ user }}
    - require:
      - user: cyware-user-{{ user }}

cyware-config-bash-rc-aliases-file:
  file.managed:
    - replace: True
    - mode: 755
    - name: /usr/local/share/cyware/bash-aliases.sh
    - source: salt://cyware/config/bash-aliases.sh
    - makedirs: True

cyware-config-bash-rc-source-aliases:
  file.append:
    - name: {{ home }}/.bashrc
    - text: |
        if [ -f /usr/local/share/cyware/bash-aliases.sh ]; then
        . /usr/local/share/cyware/bash-aliases.sh
        fi
    - require:
      - user: cyware-user-{{ user }}
    - watch:
      - file: cyware-config-bash-rc
      - file: cyware-config-bash-rc-aliases-file