{% set user = salt['pillar.get']('cyware_user', 'cyware') %}

include:
  - cyware.theme.core.gdm3

cyware-theme-autologin-true:
  file.replace:
    - name: /etc/gdm3/custom.conf
    - pattern: '#  AutomaticLoginEnable = true'
    - repl: 'AutomaticLoginEnable = true'
    - prepend_if_not_found: True
    - count: 1
    - require:
      - sls: cyware.theme.core.gdm3

cyware-theme-autologin-user:
  file.replace:
    - name: /etc/gdm3/custom.conf
    - pattern: '#  AutomaticLogin = user1'
    - repl: 'AutomaticLogin = {{ user }}'
    - prepend_if_not_found: True
    - count: 1
    - watch:
      - file: cyware-theme-autologin-true