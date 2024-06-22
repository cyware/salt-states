# Name: Balbuzard
# Website: https://github.com/decalage2/balbuzard
# Description: Extract and deobfuscate patterns from suspicious files.
# Category: Examine Static Properties: Deobfuscation
# Author: Philippe Lagadec: https://twitter.com/decalage2
# License: Free, custom license: https://github.com/decalage2/balbuzard
# Notes: balbuzard, bbcrack, bbharvest, bbtrans

include:
  - cyware.packages.python2-pip
  - cyware.python-packages.yara-python
  - cyware.packages.python3-pip

cyware-python-packages-balbuzard:
  pip.installed:
    - bin_env: /usr/bin/python2
    - name: balbuzard
    - upgrade: True
    - require:
      - sls: cyware.packages.python2-pip
      - sls: cyware.python-packages.yara-python
