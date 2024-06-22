include:
  - cyware.python3-packages.pip

cyware-python3-packages-olefile3:
  pip.installed:
    - name: olefile
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
