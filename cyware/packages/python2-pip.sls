include:
  - cyware.packages.python2
  - cyware.packages.curl

{%- if grains['oscodename'] == "bionic" %}
cyware-packages-python2-pip:
  pkg.installed:
    - name: python-pip
    - require:
      - sls: cyware.packages.python2

{%- elif grains['oscodename'] == "focal" %}
cyware-packages-python2-pip-install-script:
  cmd.run:
    - name: curl -o /tmp/get-pip.py https://bootstrap.pypa.io/pip/2.7/get-pip.py
    - unless: which pip2
    - require:
      - sls: cyware.packages.python2
      - sls: cyware.packages.curl

cyware-packages-python2-pip-install:
  cmd.run:
    - name: python2 /tmp/get-pip.py
    - unless: which pip2
    - require:
      - cmd: cyware-packages-python2-pip-install-script
{%- endif %}
