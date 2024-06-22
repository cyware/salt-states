{%- if grains['oscodename'] == "bionic" %}
include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip
  - cyware.packages.swig
  - cyware.packages.libssl-dev

cyware-python-packages-m2crypto:
  pip.installed:
    - name: m2crypto==0.40.1
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.python2-pip
      - sls: cyware.packages.swig
      - sls: cyware.packages.libssl-dev

{%- elif grains['oscodename'] == "focal" %}
include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip
  - cyware.packages.swig
  - cyware.packages.libssl-dev
  - cyware.packages.python2-dev

cyware-python-packages-m2crypto:
  pip.installed:
    - name: m2crypto==0.40.1
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.python2-pip
      - sls: cyware.packages.swig
      - sls: cyware.packages.libssl-dev
      - sls: cyware.packages.python2-dev

{%- endif %}

