{% set user = salt['pillar.get']('cyware_user', 'cyware') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

{% set all_users = salt['user.list_users']() %}

{% if user in all_users %}

cyware-user-{{ user }}:
  user.present:
    - name: {{ user }}
    - home: {{ home }}
{% else %}

cyware-user-{{ user }}:
  group.present:
    - name: {{ user }}
  user.present:
    - name: {{ user }}
    - gid: {{ user }}
    - fullname: cyware User
    - shell: /bin/bash
    - home: {{ home }}
    - password: $6$WRQ34jE9$Cemv9ULPZ0D744lbrzNbOdPhBuyzXtKF.2ZX2VIEOJB7LQ.VyduVKMORgh2Cb/53iUlQW6/wZcvfutAJKDJgc1

{% endif %}