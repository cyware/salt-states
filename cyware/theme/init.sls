include:
  - cyware.theme.core.init
  - cyware.theme.gnome-config.init
  - cyware.theme.compatibility
  - cyware.theme.autologin
  - cyware.theme.sudoers
  - cyware.theme.cleanup
  - cyware.theme.ssh
  - cyware.theme.dog
  - cyware.theme.wireshark

cyware-theme:
  test.nop:
    - require:
      - sls: cyware.theme.core.init
      - sls: cyware.theme.gnome-config.init
      - sls: cyware.theme.compatibility
      - sls: cyware.theme.autologin
      - sls: cyware.theme.sudoers
      - sls: cyware.theme.cleanup
      - sls: cyware.theme.ssh
      - sls: cyware.theme.dog
      - sls: cyware.theme.wireshark