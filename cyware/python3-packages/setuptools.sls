include:
  - cyware.python3-packages.pip

cyware-python3-packages-setuptools:
  pip.installed:
    - name: setuptools==67.7.2
    - bin_env: /usr/bin/python3
    - upgrade: False
    - force_reinstall: True
    - require:
      - sls: cyware.python3-packages.pip
