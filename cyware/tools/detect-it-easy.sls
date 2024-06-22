# Name: Detect-It-Easy
# Website: https://github.com/horsicq/Detect-It-Easy
# Description: Determine types of files and examine file properties.
# Category: Examine Static Properties: General
# Author: hors: https://twitter.com/horsicq
# License: MIT License: https://github.com/horsicq/Detect-It-Easy/blob/master/LICENSE
# Notes: GUI tool: `die`, command-line tool: `diec`.

{% set version = '3.09' %}
{%- if grains['oscodename'] == "focal" %}
{% set release = '20.04' %}
{% set hash = '198e154da31cc202e0a32b9dfb2a3ca99b5870404fc4023bf000217bd750fd5c' %}
include:
  - cyware.packages.libglib2
  - cyware.packages.qt5-default
  - cyware.packages.libqt5scripttools5

cyware-tools-detect-it-easy-source:
  file.managed:
    - name: /usr/local/src/cyware/files/die_{{ version }}_Ubuntu_{{ release }}_amd64.deb
    - source: https://github.com/horsicq/DIE-engine/releases/download/{{ version }}/die_{{ version }}_Ubuntu_{{ release }}_amd64.deb
    - source_hash: sha256={{ hash }}
    - makedirs: true

cyware-tools-detect-it-easy-cleanup1:
  file.absent:
    - name: /usr/local/bin/die
    - require:
      - file: cyware-tools-detect-it-easy-source

cyware-tools-detect-it-easy-cleanup2:
  file.absent:
    - name: /usr/local/bin/diec
    - require:
      - file: cyware-tools-detect-it-easy-cleanup1

cyware-tools-detect-it-easy-install:
  pkg.installed:
    - sources:
      - detectiteasy: /usr/local/src/cyware/files/die_{{ version }}_Ubuntu_{{ release }}_amd64.deb
    - require:
      - file: cyware-tools-detect-it-easy-cleanup2
      - sls: cyware.packages.libglib2
      - sls: cyware.packages.qt5-default
      - sls: cyware.packages.libqt5scripttools5

{%- elif grains['oscodename'] == "bionic" %}

cyware-tools-detect-it-easy-source:
  test.nop

{%- endif %}
