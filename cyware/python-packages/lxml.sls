include:
  - cyware.packages.python2-pip
  - cyware.packages.libxml2-dev
  - cyware.packages.libxslt1-dev
  - cyware.packages.python3-pip

lxml:
  pip.installed:
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.python2-pip
      - sls: cyware.packages.libxml2-dev
      - sls: cyware.packages.libxslt1-dev
