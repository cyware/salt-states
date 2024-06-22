# Name: pefile
# Website: https://github.com/erocarrera/pefile
# Description: Python library for analyzing static properties of PE files.
# Category: Examine Static Properties: PE Files
# Author: Ero Carrera: http://blog.dkbza.org
# License: MIT License: https://github.com/erocarrera/pefile/blob/master/LICENSE
# Notes: https://github.com/erocarrera/pefile/blob/wiki/UsageExamples.md#introduction

include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip

cyware-python-packages-pefile:
  pip.installed:
    - name: pefile==2019.4.18
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.python2-pip
