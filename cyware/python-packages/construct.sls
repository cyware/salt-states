include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip

construct==2.10.54:
  pip.installed:
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.python2-pip
