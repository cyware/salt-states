include:
  - cyware.python3-packages.pip

cyware-python3-packages-requests:
  pip.installed:
    - name: requests==2.31.0
    - bin_env: /usr/bin/python3
    - upgrade: False
    - force_reinstall: True
    - require:
      - sls: cyware.python3-packages.pip
