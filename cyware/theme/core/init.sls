include:
  - cyware.theme.core.gnome-session
  - cyware.theme.core.gdm3
  - cyware.theme.core.open-vm-tools-desktop
  - cyware.theme.core.gnome-terminal
  - cyware.theme.core.gnome-shell-extensions
  - cyware.theme.core.gnome-tweaks


cyware-theme-core:
  test.nop:
    - require:
      - sls: cyware.theme.core.gnome-session
      - sls: cyware.theme.core.gdm3
      - sls: cyware.theme.core.open-vm-tools-desktop
      - sls: cyware.theme.core.gnome-terminal
      - sls: cyware.theme.core.gnome-shell-extensions
      - sls: cyware.theme.core.gnome-tweaks