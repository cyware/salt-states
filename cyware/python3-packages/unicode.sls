# Name: unicode
# Website: https://github.com/garabik/unicode
# Description: Display Unicode character properties.
# Category: Examine Static Properties: Deobfuscation
# Author: Radovan Garabik
# License: GNU General Public License (GPL) v3: https://github.com/garabik/unicode/blob/master/COPYING
# Notes: 

include:
  - cyware.python3-packages.pip

cyware-python3-packages-unicode:
  pip.installed:
    - name: unicode
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip

