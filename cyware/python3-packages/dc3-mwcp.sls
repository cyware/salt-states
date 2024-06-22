# Name: DC3-MWCP
# Website: https://github.com/Defense-Cyber-Crime-Center/DC3-MWCP
# Description: Parsing configuration information from malware.
# Category: Examine Static Properties: Deobfuscation
# Author: Defense Cyber Crime Center - United States Government
# License: Some parts Public Domain, some MIT License: https://github.com/Defense-Cyber-Crime-Center/DC3-MWCP/blob/master/LICENSE.txt
# Notes: mwcp

include:
  - cyware.python3-packages.pip

cyware-dc3-mwcp-install:
  pip.installed:
    - name: mwcp
    - bin_env: /usr/bin/python3
    - ignore_installed: True
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
