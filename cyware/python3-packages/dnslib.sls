include:
  - cyware.python3-packages.pip

cyware-python3-packages-wheel:
  pip.installed:
    - name: wheel==0.36.2
    - bin_env: /usr/bin/python3
    - require:
      - sls: cyware.python3-packages.pip
