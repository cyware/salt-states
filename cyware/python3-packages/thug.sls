# Name: thug
# Website: https://github.com/buffer/thug
# Description: Examine suspicious website using this low-interaction honeyclient.
# Category: Explore Network Interactions: Connecting
# Author: Angelo Dell'Aera
# License: GNU General Public License (GPL) v2: https://github.com/buffer/thug/blob/master/LICENSE.txt
# Notes: thug -F

{%- set version="11.7.439.19" %}
{% if grains['oscodename'] == "focal" %}
  {% set py3_version="python3.9" %}
  {% set py3_dependency="python39" %} 
  {%- set release="stpyv8-ubuntu-20.04-python-3.9.zip" %}
  {%- set hash="b595998a67a9b70b9d97dc22fd0e36674f60629790f250458681413912692b8a" %}
  {%- set wheel="stpyv8-" + version + "-cp39-cp39-linux_x86_64.whl" %}
  {%- set folder="stpyv8-ubuntu-20.04-3.9" %}
{% elif grains['oscodename'] == "jammy" %}
  {% set py3_version="python3" %}
  {% set py3_dependency="python3" %} 
  {%- set release="stpyv8-ubuntu-22.04-python-3.10.zip" %}
  {%- set hash="757bb89229c659d517c23ec6fae56f5c76437fc3a72bbac7584805efcbe0b19e" %}
  {%- set wheel="stpyv8-" + version + "-cp310-cp310-linux_x86_64.whl" %}
  {%- set folder="stpyv8-ubuntu-22.04-3.10" %}
{% endif %}

include:
  - cyware.packages.git
  - cyware.python3-packages.pip
  - cyware.python3-packages.setuptools
  - cyware.packages.libemu
  - cyware.packages.libgraphviz-dev
  - cyware.packages.libxml2-dev
  - cyware.packages.libxslt1-dev
  - cyware.packages.libffi-dev
  - cyware.packages.libfuzzy-dev
  - cyware.packages.libfuzzy2
  - cyware.packages.libjpeg-dev
  - cyware.packages.tesseract-ocr
  - cyware.packages.libssl-dev
  - cyware.python3-packages.pytesseract
  - cyware.packages.virtualenv
  - cyware.packages.{{ py3_dependency }}
  - cyware.packages.{{ py3_dependency }}-dev
  - cyware.packages.sudo
  - cyware.packages.libboost-python-dev
  - cyware.packages.libboost-system-dev
  - cyware.packages.libboost-iostreams-dev
  - cyware.packages.libboost-dev
  - cyware.packages.build-essential

cyware-python3-packages-remove-thug:
  pip.removed:
    - name: thug
    - bin_env: /usr/bin/python3

cyware-python3-packages-thug-virtualenv:
  virtualenv.managed:
    - name: /opt/thug
    - venv_bin: /usr/bin/virtualenv
    - python: /usr/bin/{{ py3_version }}
    - pip_pkgs:
      - pip>=23.1.2
      - setuptools==67.7.2
      - wheel==0.38.4
      - "yara-python"
    - require:
      - sls: cyware.packages.{{ py3_dependency }}
      - sls: cyware.packages.virtualenv
      - sls: cyware.packages.{{ py3_dependency }}-dev
      - pip: cyware-python3-packages-remove-thug

cyware-python3-packages-thug-venv-stpyv8-source:
  file.managed:
    - name: /usr/local/src/cyware/files/{{ release }}
    - source: https://github.com/cloudflare/stpyv8/releases/download/v{{ version }}/{{ release }}
    - source_hash: sha256={{ hash }}
    - makedirs: True

cyware-python3-packages-thug-venv-stpyv8-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/
    - source: /usr/local/src/cyware/files/{{ release }}
    - enforce_toplevel: False
    - watch:
      - file: cyware-python3-packages-thug-venv-stpyv8-source

cyware-python3-packages-thug-venv-stpyv8-pip:
  pip.installed:
    - name: /usr/local/src/cyware/{{ folder }}/{{ wheel }}
    - bin_env: /opt/thug/bin/python3
    - require:
      - sls: cyware.python3-packages.pip
      - sls: cyware.packages.sudo
      - sls: cyware.packages.libboost-python-dev
      - sls: cyware.packages.libboost-system-dev
      - sls: cyware.packages.libboost-dev
      - sls: cyware.packages.libboost-iostreams-dev
      - sls: cyware.python3-packages.setuptools
      - file: cyware-python3-packages-thug-venv-stpyv8-source
      - archive: cyware-python3-packages-thug-venv-stpyv8-archive

cyware-python3-packages-thug-git:
  git.latest:
    - name: https://github.com/buffer/thug
    - target: /usr/local/src/thug
    - branch: master
    - force_reset: True
    - force_checkout: True
    - force_fetch: True
    - require:
      - sls: cyware.packages.git

cyware-python3-packages-thug-packages:
  pip.installed:
    - name: thug
    - bin_env: /opt/thug/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
      - virtualenv: cyware-python3-packages-thug-virtualenv
      - sls: cyware.packages.libssl-dev
    - watch:
      - git: cyware-python3-packages-thug-git

cyware-python3-packages-thug-makedir:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True
    - names:
      - /etc/thug
    - watch:
      - pip: cyware-python3-packages-thug-packages

cyware-python3-packages-thug-conf:
  cmd.run:
    - name: cp -R /usr/local/src/thug/thug/conf/* /etc/thug
    - watch:
      - file: cyware-python3-packages-thug-makedir

cyware-python3-packages-thug-symlink:
  file.symlink:
    - name: /usr/local/bin/thug
    - target: /opt/thug/bin/thug
    - makedirs: False
    - force: True
    - require:
      - pip: cyware-python3-packages-thug-packages
