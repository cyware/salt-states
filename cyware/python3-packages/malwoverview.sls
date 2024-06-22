# Name: malwoverview
# Website: https://github.com/alexandreborges/malwoverview
# Description: Query public repositories of malware data (e.g., VirusTotal, HybridAnalysis).
# Category: Gather and Analyze Data
# Author: Alexandre Borges
# License: GNU General Public License v3: https://github.com/alexandreborges/malwoverview/blob/master/LICENSE
# Notes: malwoverview.py, add API keys to ~/.malwapi.conf
{%- if grains['oscodename'] == "bionic" %}
  {%- set python3_version="python3.6" %}
{%- else %}
  {%- set python3_version="python3.8" %}
{% endif %}
{%- set user = salt['pillar.get']('cyware_user', 'cyware') -%}       

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - cyware.python3-packages.pip
  - cyware.packages.git
  - cyware.config.user
  - cyware.packages.python3-virtualenv
  - cyware.packages.python3-venv
  - cyware.packages.virtualenv
  - cyware.packages.build-essential

cyware-python3-packages-malwoverview-virtualenv:
  virtualenv.managed:
    - name: /opt/malwoverview
    - venv_bin: /usr/bin/virtualenv
    - python: /usr/bin/python3
    - pip_pkgs:
      - pip
      - setuptools
      - wheel
    - require:
      - sls: cyware.python3-packages.pip
      - sls: cyware.packages.python3-virtualenv
      - sls: cyware.packages.python3-venv
      - sls: cyware.packages.virtualenv

cyware-python3-packages-malwoverview-install:
  pip.installed:
    - name: malwoverview
    - bin_env: /opt/malwoverview/bin/python3
    - upgrade: True
    - user: root
    - require:
      - sls: cyware.python3-packages.pip
      - virtualenv: cyware-python3-packages-malwoverview-virtualenv
      - sls: cyware.packages.git
      - sls: cyware.config.user

cyware-python3-packages-malwoverview-config-file:
  file.managed:
    - name: {{ home }}/.malwapi.conf
    - source: /opt/malwoverview/lib/{{ python3_version }}/site-packages/root/.malwapi.conf
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: False
    - require:
      - sls: cyware.config.user
      - user: cyware-user-{{ user }}
      - pip: cyware-python3-packages-malwoverview-install
      - virtualenv: cyware-python3-packages-malwoverview-virtualenv

cyware-python3-packages-malwoverview-symlink:
  file.symlink:
    - name: /usr/local/bin/malwoverview.py
    - target: /opt/malwoverview/bin/malwoverview.py
    - force: true
    - require:
      - file: cyware-python3-packages-malwoverview-config-file
