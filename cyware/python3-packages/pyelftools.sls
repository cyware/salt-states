# Name: pyelftools
# Website: https://github.com/eliben/pyelftools
# Description: Python library for parsing and analyzing ELF files and DWARF debugging information. 
# Category: Examine Static Properties: ELF Files
# Author: Eli Bendersky
# License: Public Domain: https://github.com/eliben/pyelftools/blob/master/LICENSE
# Notes: readelf.py

include:
  - cyware.python3-packages.pip

cyware-python3-packages-pyelftools:
  pip.installed:
    - name: pyelftools
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
