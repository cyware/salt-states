include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip

pysocks:
  pip.installed:
    - bin_env: /usr/bin/python2
    - upgrade: True
    - name: pysocks
    - require:
      - sls: cyware.packages.python2-pip
