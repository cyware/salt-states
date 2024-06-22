{%- set user = salt['pillar.get']('cyware_user', 'cyware') -%}

{%- if user == "root" -%}
  {%- set home = "/root" -%}
{%- else %}
  {%- set home = "/home/" + user -%}
{%- endif -%}

include:
  - cyware.config.user
  - cyware.theme.core.gnome-shell-extensions
  - cyware.theme.core.gnome-terminal
  - cyware.theme.core.gnome-tweaks
  - cyware.tools.cutter
  - cyware.tools.binnavi
  - cyware.tools.cyberchef
  - cyware.tools.networkminer
  - cyware.theme.gnome-config.remove-app-icons
  - cyware.tools.detect-it-easy

cyware-gnome-config-logo:
  file.managed:
    - name: /usr/local/share/cyware/cyware-logo.png
    - source: salt://cyware/theme/gnome-config/cyware-logo.png
    - makedirs: True

cyware-gnome-config-script:
  file.managed:
      - name: /usr/local/share/cyware/gnome-config.sh
      - source: salt://cyware/theme/gnome-config/gnome-config.sh
      - mode: 755
      - makedirs: True
      - watch:
        - file: cyware-gnome-config-logo
      - require:
        - sls: cyware.theme.core.gnome-shell-extensions

cyware-gnome-config-dconf-directory:
  file.directory:
    - makedirs: True
    - user: {{ user }}
    - group: {{ user }}
    - name: {{ home }}/.config/dconf
    - require:
      - user: cyware-user-{{ user }}
    - watch:
      - file: cyware-gnome-config-script

cyware-gnome-config-autostart:
  file.managed:
    - replace: False
    - user: {{ user }}
    - group: {{ user }}
    - name: {{ home }}/.config/autostart/gnome-config.desktop
    - source: salt://cyware/theme/gnome-config/gnome-config.desktop
    - makedirs: True
    - require:
      - user: cyware-user-{{ user }}
      - file: cyware-gnome-config-dconf-directory
      - file: cyware-gnome-config-script

cyware-gnome-config-autostart-terminal:
  file.managed:
    - replace: False
    - user: {{ user }}
    - group: {{ user }}
    - name: {{ home }}/.config/autostart/gnome-terminal.desktop
    - source: salt://cyware/theme/gnome-config/gnome-terminal.desktop
    - makedirs: True
    - require:
      - user: cyware-user-{{ user }}
      - sls: cyware.theme.core.gnome-terminal

cyware-gnome-config-autostart-ignore-lid-switch-tweak:
  file.managed:
    - replace: False
    - user: {{ user }}
    - group: {{ user }}
    - name: {{ home }}/.config/autostart/ignore-lid-switch-tweak.desktop
    - source: salt://cyware/theme/gnome-config/ignore-lid-switch-tweak.desktop
    - makedirs: True
    - require:
      - sls: cyware.theme.core.gnome-tweaks

# Allow root to run X commands
cyware-gnome-config-autostart-xhost:
  file.managed:
    - replace: False
    - user: {{ user }}
    - group: {{ user }}
    - name: {{ home }}/.config/autostart/xhost.desktop
    - source: salt://cyware/theme/gnome-config/xhost.desktop
    - makedirs: True
    - require:
      - sls: cyware.theme.core.gnome-tweaks

cyware-gnome-config-autostart-parent-owner:
  file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - name: {{ home }}/.config
    - require:
      - user: cyware-user-{{ user }}
    - watch:
      - file: cyware-gnome-config-autostart-xhost

cyware-gnome-config-terminal-profiles-file:
  file.managed:
    - name: /usr/local/share/cyware/terminal-profiles.ini
    - source: salt://cyware/theme/gnome-config/terminal-profiles.ini
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True
    - require:
      - sls: cyware.theme.core.gnome-terminal

cyware-gnome-config-terminal-profiles-install:
  cmd.run:
    - name: dbus-run-session -- dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ < /usr/local/share/cyware/terminal-profiles.ini
    - runas: {{ user }}
    - cwd: {{ home }}
    - shell: /bin/bash
    - require:
      - user: cyware-user-{{ user }}
    - watch:
      - file: cyware-gnome-config-terminal-profiles-file

cyware-gnome-config-keyring-ssh-disable-autostart:
  file.replace:
    - name: /etc/xdg/autostart/gnome-keyring-ssh.desktop
    - pattern: 'X-GNOME-Autostart-enabled=false'
    - repl: 'X-GNOME-Autostart-enabled=false'
    - append_if_not_found: True
    - count: 1

cyware-gnome-config-cutter-icon:
  file.managed:
    - replace: False
    - name: /usr/share/applications/cutter.desktop
    - source: salt://cyware/theme/gnome-config/cutter.desktop
    - makedirs: True
    - require:
      - sls: cyware.tools.cutter

cyware-gnome-config-binnavi-icon-file:
  file.managed:
    - replace: False
    - name: /usr/share/icons/binnavi.png
    - source: salt://cyware/theme/gnome-config/binnavi.png
    - makedirs: True
    - require:
      - sls: cyware.tools.binnavi

cyware-gnome-config-binnavi-icon:
  file.managed:
    - replace: False
    - name: /usr/share/applications/binnavi.desktop
    - source: salt://cyware/theme/gnome-config/binnavi.desktop
    - makedirs: True
    - watch:
      - file: cyware-gnome-config-binnavi-icon-file

cyware-gnome-config-cyberchef-icon-file:
  file.managed:
    - replace: False
    - name: /usr/share/icons/cyberchef.png
    - source: salt://cyware/theme/gnome-config/cyberchef.png
    - makedirs: True
    - require:
      - sls: cyware.tools.cyberchef

cyware-gnome-config-networkminer-icon-file:
  file.managed:
    - replace: False
    - name: /usr/share/icons/networkminer.png
    - source: salt://cyware/theme/gnome-config/networkminer.png
    - makedirs: True
    - require:
      - sls: cyware.tools.networkminer

cyware-gnome-config-networkminer-icon:
  file.managed:
    - replace: False
    - name: /usr/share/applications/networkminer.desktop
    - source: salt://cyware/theme/gnome-config/networkminer.desktop
    - makedirs: True
    - watch:
      - file: cyware-gnome-config-networkminer-icon-file

cyware-gnome-config-cyberchef-icon:
  file.managed:
    - replace: False
    - name: /usr/share/applications/cyberchef.desktop
    - source: salt://cyware/theme/gnome-config/cyberchef.desktop
    - makedirs: True
    - watch:
      - file: cyware-gnome-config-cyberchef-icon-file

cyware-theme-gnome-config:
  test.nop:
    - require:
      - sls: cyware.theme.gnome-config.remove-app-icons

{%- if grains['oscodename'] == "focal" %}

cyware-gnome-config-detect-it-easy-icon-file:
  file.managed:
    - replace: False
    - name: /usr/share/icons/die.png
    - source: salt://cyware/theme/gnome-config/die.png
    - makedirs: True
    - require:
      - sls: cyware.tools.detect-it-easy

cyware-gnome-config-detect-it-easy-icon:
  file.managed:
    - replace: False
    - name: /usr/share/applications/die.desktop
    - source: salt://cyware/theme/gnome-config/die.desktop
    - makedirs: True
    - watch:
      - file: cyware-gnome-config-detect-it-easy-icon-file

{%- elif grains['oscodename'] == "bionic" %}

cyware-gnome-config-detect-it-easy-icon:
  test.nop

{%- endif %}