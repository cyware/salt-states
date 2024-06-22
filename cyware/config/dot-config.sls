# Sometimes subdirectories under .config end up owned by root. Let's fix that.

{%- set user = salt['pillar.get']('cyware_user', 'cyware') -%}


{% if user != "root" %}

{% set home = "/home/" + user  %}

include:
  - cyware.config.user

cyware-dot-config-owner:
  file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - name: {{ home }}/.config
    - makedirs: True
    - recurse:
      - user
      - group
    - require:
      - user: cyware-user-{{ user }}

{% endif %}