include:
  - cyware.python3-packages.pip

cyware-python3-packages-cffi:
  pip.installed:
    - name: cffi
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
