include:
  - cyware.python3-packages.pip

cyware-python3-packages-colorama:
  pip.installed:
    - name: colorama
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
