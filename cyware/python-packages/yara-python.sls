{%- if grains['oscodename'] == "bionic" %}
include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip

yara-python:
  pip.installed:
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.python2-pip

{%- elif grains['oscodename'] == "focal" %}
include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip
  - cyware.packages.python2-dev

yara-python:
  pip.installed:
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.python2-pip
      - sls: cyware.packages.python2-dev

{%- endif %}
