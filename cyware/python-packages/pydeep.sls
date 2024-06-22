include:
  - cyware.packages.python2-pip
  - cyware.packages.libfuzzy-dev
  - cyware.packages.python3-pip

pydeep:
  pip.installed:
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.python2-pip
      - sls: cyware.packages.libfuzzy-dev
