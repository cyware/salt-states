# Name: ViperMonkey
# Website: https://www.decalage.info/en/vba_emulation
# Description: A VBA parser and emulation engine to analyze malicious macros.
# Category: Analyze Documents: Microsoft Office
# Author: Philippe Lagadec: https://twitter.com/decalage2
# License: Free, custom license: https://github.com/decalage2/ViperMonkey#license
# Notes: vmonkey

{%- if grains['oscodename'] == "focal" %}

include:
  - cyware.packages.python2-pip
  - cyware.packages.git
  - cyware.packages.virtualenv
  - cyware.packages.python3-pip
  - cyware.packages.python2-dev

{%- else %}

include:
  - cyware.packages.python2-pip
  - cyware.packages.git
  - cyware.packages.virtualenv
  - cyware.packages.python3-pip

{%- endif %}

cyware-python-packages-vipermonkey-virtualenv:
  virtualenv.managed:
    - name: /opt/vipermonkey
    - venv_bin: /usr/bin/virtualenv
    - python: /usr/bin/python2
    - pip_pkgs:
      - pip
      - setuptools
      - wheel
    - require:
      - sls: cyware.packages.python2-pip
      - sls: cyware.packages.virtualenv

{%- if grains['oscodename'] == "focal" %}

cyware-python-packages-vipermonkey-regex:
  pip.installed:
    - name: regex<2022.1.18
    - bin_env: /opt/vipermonkey/bin/python
    - require:
      - sls: cyware.packages.python2-pip
      - sls: cyware.packages.python2-dev

cyware-python-packages-vipermonkey-unidecode:
  pip.installed:
    - name: unidecode==1.2.0
    - bin_env: /opt/vipermonkey/bin/python
    - require:
      - sls: cyware.packages.python2-pip
      - sls: cyware.packages.python2-dev
      - pip: cyware-python-packages-vipermonkey-regex

cyware-python-packages-vipermonkey-install:
  pip.installed:
    - name: git+https://github.com/decalage2/ViperMonkey.git
    - bin_env: /opt/vipermonkey/bin/python
    - require:
      - sls: cyware.packages.git
      - sls: cyware.packages.python2-pip
      - sls: cyware.packages.python2-dev
      - pip: cyware-python-packages-vipermonkey-unidecode
      - virtualenv: cyware-python-packages-vipermonkey-virtualenv

{%- else %}

cyware-python-packages-vipermonkey-unidecode:
  pip.installed:
    - name: unidecode==1.2.0
    - bin_env: /opt/vipermonkey/bin/python
    - require:
      - sls: cyware.packages.python2-pip

cyware-python-packages-vipermonkey-install:
  pip.installed:
    - name: git+https://github.com/decalage2/ViperMonkey.git
    - bin_env: /opt/vipermonkey/bin/python
    - require:
      - sls: cyware.packages.git
      - sls: cyware.packages.python2-pip
      - pip: cyware-python-packages-vipermonkey-unidecode
      - virtualenv: cyware-python-packages-vipermonkey-virtualenv

{%- endif %}

cyware-python-packages-vipermonkey-symlink:
  file.symlink:
    - name: /usr/local/bin/vmonkey
    - target: /opt/vipermonkey/bin/vmonkey
    - force: true
    - require:
      - pip: cyware-python-packages-vipermonkey-install

