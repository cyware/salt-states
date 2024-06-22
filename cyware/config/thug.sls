{% set user = salt['pillar.get']('cyware_user', 'cyware') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - cyware.config.user
  - cyware.config.bash-rc
  - cyware.python3-packages.thug

cyware-config-thug:
  file.directory:
    - name: /var/log/thug
    - makedirs: True
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - require:
      - user: cyware-user-{{ user }}
    - require:
      - sls: cyware.python3-packages.thug

cyware-config-thug-bash-rc:
  file.append:
    - name: {{ home }}/.bashrc
    - text: 'export THUG_LOGBASE=/var/log/thug'
    - require:
      - user: cyware-user-{{ user }}
    - watch:
       - file: cyware-config-bash-rc
       - file: cyware-config-thug
