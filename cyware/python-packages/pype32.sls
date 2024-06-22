include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip

pype32:
  pip.installed:
    - bin_env: /usr/bin/python2
    - require:
      - sls: cyware.packages.python2-pip
