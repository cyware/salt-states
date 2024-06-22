# Name: STPyV8
# Website: https://github.com/cloudflare/stpyv8
# Description: Python3 and JavaScript interop engine, fork of the original PyV8 project
# Category: Dynamically Reverse-Engineer Code: Scripts
# Author: Area1 Security
# License: Apache License 2.0: https://github.com/cloudflare/stpyv8/blob/master/LICENSE.txt
# Notes:

{%- set version="11.7.439.19" %}
{%- if grains['oscodename'] == "bionic" %} 
Ubuntu Bionic is no longer supported:
  test.nop
{% elif grains['oscodename'] == "focal" %} 
  {%- set release="stpyv8-ubuntu-20.04-python-3.8.zip" %}
  {%- set hash="bf6821faf6669e07057478edf22c0e02351e7922494dbff377f216920235d8b7" %}
  {%- set wheel="stpyv8-" + version + "-cp38-cp38-linux_x86_64.whl" %}
  {%- set folder="stpyv8-ubuntu-20.04-3.8" %}
{%- endif %}

include:
  - cyware.packages.sudo
  - cyware.packages.libboost-python-dev
  - cyware.packages.libboost-system-dev
  - cyware.packages.libboost-iostreams-dev
  - cyware.packages.libboost-dev
  - cyware.packages.build-essential
  - cyware.python3-packages.pip
  - cyware.python3-packages.setuptools

cyware-python3-packages-stpyv8-source:
  file.managed:
    - name: /usr/local/src/cyware/files/{{ release }}
    - source: https://github.com/cloudflare/stpyv8/releases/download/v{{ version }}/{{ release }}
    - source_hash: sha256={{ hash }}
    - makedirs: True

cyware-python3-packages-stpyv8-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/
    - source: /usr/local/src/cyware/files/{{ release }}
    - enforce_toplevel: False
    - watch:
      - file: cyware-python3-packages-stpyv8-source

cyware-pip3-stpyv8:
  pip.installed:
    - name: /usr/local/src/cyware/{{ folder }}/{{ wheel }}
    - bin_env: /usr/bin/python3
    - require:
      - sls: cyware.python3-packages.pip
      - sls: cyware.packages.sudo
      - sls: cyware.packages.libboost-python-dev
      - sls: cyware.packages.libboost-system-dev
      - sls: cyware.packages.libboost-dev
      - sls: cyware.packages.libboost-iostreams-dev
      - sls: cyware.python3-packages.setuptools
