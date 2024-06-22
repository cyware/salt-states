{%- if grains['oscodename'] == "bionic" %}
include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip

# distorm3 v3.5.0 breaks Volatility 2.6.1, so we're installing distorm3 v3.4.4
distorm3==3.4.4:
  pip.installed:
    - bin_env: /usr/bin/python2
    - require:
      - sls: cyware.packages.python2-pip

{%- elif grains['oscodename'] == "focal" %}
include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip
  - cyware.packages.python2-dev

distorm3==3.4.4:
  pip.installed:
    - bin_env: /usr/bin/python2
    - require:
      - sls: cyware.packages.python2-pip
      - sls: cyware.packages.python2-dev

{%- endif %}
