include:
  - cyware.packages.python3-pip

python3-cryptography:
  pip.installed:
    - name: cryptography==39.0.2
    - bin_env: /usr/bin/python3
    - upgrade: False
    - require:
      - sls: cyware.packages.python3-pip
