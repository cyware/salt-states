include:
  - cyware.python3-packages.pip

importlib-metadata<5.0.0:
  pip.installed:
    - bin_env: /usr/bin/python3
    - upgrade: False
    - require:
      - sls: cyware.python3-packages.pip