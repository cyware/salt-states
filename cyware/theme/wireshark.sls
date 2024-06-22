{% set user = salt['pillar.get']('cyware_user', 'cyware') %}

{% if user != "root" %}


include:
  - cyware.config.user
  - cyware.packages.wireshark

cyware-theme-wireshark-reconfigure:
  cmd.run:
    - name: echo "wireshark-common wireshark-common/install-setuid select True"| debconf-set-selections; dpkg-reconfigure -f noninteractive wireshark-common
    - watch:
        - sls: cyware.packages.wireshark

cyware-theme-wireshark-group:
  group.present:
    - name: wireshark
    - system: True
    - members:
        - {{ user }}
    - watch:
      - cmd: cyware-theme-wireshark-reconfigure
    - require:
      - user: cyware-user-{{ user }}

{% endif %}