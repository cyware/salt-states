include:
  - cyware.python3-packages.pip

pycryptodomex:
  pip.installed:
    - bin_env: /usr/bin/python3
    - name: pycryptodomex == 3.7.3
    - require:
      - sls: cyware.python3-packages.pip
