{%- set user = salt['pillar.get']('cyware_user', 'cyware') -%}         

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - cyware.config.user
  - cyware.packages.wget

cyware-config-wget:
  file.managed:
    - name: {{ home }}/.wgetrc
    - source: salt://cyware/config/wget/wgetrc
    - user: {{ user }}
    - group: {{ user }}
    - require:
      - user: cyware-user-{{ user }}
    - watch:
      - pkg: cyware-packages-wget
