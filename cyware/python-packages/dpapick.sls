include:
  - cyware.packages.libssl-dev
  - cyware.packages.python2-pip
  - cyware.python-packages.m2crypto
  - cyware.packages.python3-pip

dpapick:
  pip.installed:
    - name: dpapick
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.libssl-dev
      - sls: cyware.packages.python2-pip
      - sls: cyware.python-packages.m2crypto
