# Sometimes .bash_history ends up owned by root. Let's fix that.

{% set user = salt['pillar.get']('cyware_user', 'cyware') %}

{% if user != "root" %}

{% set home = "/home/" + user  %}

include:
  - cyware.config.user

cyware-config-bash-history:
  file.managed:
    - replace: False
    - name: {{ home }}/.bash_history
    - user: {{ user }}
    - group: {{ user }}
    - require:
      - user: cyware-user-{{ user }}

{% endif %}