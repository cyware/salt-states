include:
  - cyware.theme.gnome-config.init

/usr/share/cyware:
  file.symlink:
  - target: /usr/local/share/cyware
  - require:
    - sls: cyware.theme.gnome-config.init