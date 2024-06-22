include:
  - cyware.python3-packages.pip

cyware-python3-packages-protobuf-install:
  pip.installed:
    - name: protobuf
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
