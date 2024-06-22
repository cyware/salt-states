include:
  - cyware.python3-packages.pip
  - cyware.packages.libemu

cyware-python3-packages-pylibemu:
  pip.installed:
    - name: pylibemu
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
      - sls: cyware.packages.libemu
