include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip

ndg-httpsclient:
  pip.installed:
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.python2-pip
