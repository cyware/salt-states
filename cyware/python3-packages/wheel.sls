include:
  - cyware.python3-packages.pip

cyware-python3-packages-wheel:
  pip.installed:
    - name: wheel==0.38.4
    - bin_env: /usr/bin/python3
    - upgrade: False
    - force_reinstall: True
    - require:
      - sls: cyware.python3-packages.pip
