{%- set user = salt['pillar.get']('cyware_user', 'cyware') -%}       

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - cyware.config.user
  - cyware.packages.curl

cyware-config-curl:
  file.managed:
    - name: {{ home }}/.curlrc
    - source: salt://cyware/config/curl/curlrc
    - user: {{ user }}
    - group: {{ user }}
    - require:
      - user: cyware-user-{{ user }}
    - watch:
      - pkg: cyware-packages-curl
