{% set user = salt['pillar.get']('cyware_user', 'cyware') %}

include:
  - cyware.config.user

cyware-theme-sudoers:
  file.append:
    - name: /etc/sudoers.d/cyware
    - text: "{{ user }} ALL=NOPASSWD: ALL\nDefaults env_keep += \"ftp_proxy http_proxy https_proxy no_proxy\""
    - makedirs: True
    - require:
      - user: cyware-user-{{ user }}