include:
  - cyware.python3-packages.pip
  - cyware.python3-packages.pycryptodomex

cyware-python3-packages-pyzipper:
  pip.installed:
    - name: pyzipper
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
      - sls: cyware.python3-packages.pycryptodomex
