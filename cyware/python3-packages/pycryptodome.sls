include:
  - cyware.python3-packages.pip

pycryptodome==3.9.7:
  pip.installed:
    - bin_env: /usr/bin/python3
    - require:
      - sls: cyware.python3-packages.pip
