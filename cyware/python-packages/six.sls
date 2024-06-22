include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip

six:
  pip.installed:
    - bin_env: /usr/bin/python2
    - name: six >= 1.6
    - upgrade: True
    - require:
      - sls: cyware.packages.python2-pip
