include:
  - cyware.packages.python3-pip

cyware-python3-packages-pip3:
  pip.installed:
    - name: pip>=23.1.2
    - bin_env: /usr/bin/python3
    - upgrade: False
    - force_reinstall: True
    - require:
      - sls: cyware.packages.python3-pip
