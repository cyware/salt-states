# Name: RATDecoders
# Website: https://github.com/kevthehermit/RATDecoders
# Description: Python3 Decoders for Remote Access Trojans
# Category: Examine Static Properties: Deobfuscation
# Author: Kevin Breen: https://twitter.com/KevTheHermit
# License: MIT License: https://github.com/kevthehermit/RATDecoders/blob/master/LICENSE
# Notes: malconf

include:
  - cyware.python3-packages.pip
  - cyware.packages.git
  - cyware.python3-packages.androguard
  - cyware.python3-packages.yara-python3

cyware-python3-packages-ratdecoders:
  pip.installed:
    - name: malwareconfig
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
      - sls: cyware.packages.git
      - sls: cyware.python3-packages.androguard
      - sls: cyware.python3-packages.yara-python3
