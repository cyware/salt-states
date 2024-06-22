# Name: DroidLysis
# Website: https://github.com/cryptax/droidlysis
# Description: Perform static analysis of Android applications.
# Category: Statically Analyze Code: Android, Examine Static Properties: General
# Author: cryptax
# License: MIT License: https://github.com/cryptax/droidlysis/blob/master/LICENSE
# Notes: droidlysis
{%- if grains['oscodename'] == "bionic" %}
  {%- set python3_version="python3.6" %}
{%- elif grains['oscodename'] == "focal" %}
  {%- set python3_version="python3.8" %}
{% endif %}

include:
  - cyware.python3-packages.pip
  - cyware.python3-packages.typing-extensions
  - cyware.tools.apktool
  - cyware.packages.baksmali
  - cyware.packages.dex2jar
  - cyware.packages.procyon-decompiler
  - cyware.packages.unzip

cyware-python-packages-droidlysis:
  pip.installed:
    - name: droidlysis
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.tools.apktool
      - sls: cyware.packages.baksmali
      - sls: cyware.packages.dex2jar
      - sls: cyware.python3-packages.pip
      - sls: cyware.packages.procyon-decompiler
      - sls: cyware.packages.unzip
      - sls: cyware.python3-packages.typing-extensions

cyware-python-packages-droidlysis-droidconfig-set1:
  file.replace:
    - name: /usr/local/lib/{{ python3_version }}/dist-packages/conf/general.conf
    - pattern: '^apktool =.*$'
    - repl: 'apktool = /usr/local/apktool/apktool_2.7.0.jar'
    - prepend_if_not_found: False
    - count: 1
    - require:
      - pip: cyware-python-packages-droidlysis

cyware-python-packages-droidlysis-droidconfig-set2:
  file.replace:
    - name: /usr/local/lib/{{ python3_version }}/dist-packages/conf/general.conf
    - pattern: '^baksmali =.*$'
    - repl: 'baksmali = /opt/baksmali/baksmali-2.4.0.jar'
    - prepend_if_not_found: False
    - count: 1
    - require:
      - pip: cyware-python-packages-droidlysis

cyware-python-packages-droidlysis-droidconfig-set3:
  file.replace:
    - name: /usr/local/lib/{{ python3_version }}/dist-packages/conf/general.conf
    - pattern: '^dex2jar =.*$'
    - repl: 'dex2jar = /usr/bin/d2j-dex2jar'
    - prepend_if_not_found: False
    - count: 1
    - require:
      - pip: cyware-python-packages-droidlysis

cyware-python-packages-droidlysis-droidconfig-set4:
  file.replace:
    - name: /usr/local/lib/{{ python3_version }}/dist-packages/conf/general.conf
    - pattern: '^procyon =.*$'
    - repl: 'procyon = /usr/share/java/procyon-decompiler-0.5.32.jar'
    - prepend_if_not_found: False
    - count: 1
    - require:
      - pip: cyware-python-packages-droidlysis
