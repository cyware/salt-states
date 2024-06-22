include:
  - cyware.python3-packages.pip

cyware-python3-packages-setuptools-rust:
  pip.installed:
    - name: setuptools_rust
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
