# Sometimes .local ends up owned by root. Let's fix that.

{%- set user = salt['pillar.get']('cyware_user', 'cyware') -%}


{% if user != "root" %}

{% set home = "/home/" + user  %}

include:
  - cyware.config.user

cyware-dot-local-owner:
  file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - name: {{ home }}/.local
    - makedirs: True
    - recurse:
      - user
      - group
    - require:
      - user: cyware-user-{{ user }}

{% endif %}