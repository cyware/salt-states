# Sometimes subdirectories under .cache end up owned by root. Let's fix that.

{%- set user = salt['pillar.get']('cyware_user', 'cyware') -%}


{% if user != "root" %}

{% set home = "/home/" + user  %}

include:
  - cyware.config.user

cyware-dot-cache-owner:
  file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - name: {{ home }}/.cache
    - makedirs: True
    - recurse:
      - user
      - group
    - require:
      - user: cyware-user-{{ user }}

{% endif %}