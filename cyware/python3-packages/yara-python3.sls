include:
  - cyware.python3-packages.pip
  - cyware.packages.libssl-dev

cyware-python-packages-yara-python3:
  pip.installed:
    - name: "yara-python"
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.packages.libssl-dev
      - sls: cyware.python3-packages.pip
