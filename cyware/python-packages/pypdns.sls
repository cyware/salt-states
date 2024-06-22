# Name: PyPDNS
# Website: https://github.com/CIRCL/PyPDNS
# Description: Python library to query passive DNS services that follow the Passive DNS - Common Output Format
# Category: Gather and Analyze Data
# Author: Raphael Vinot, Alexandre Dulaunoy, CIRCL - Computer Incident Response Center Luxembourg
# License: Free, custom license: https://github.com/CIRCL/PyPDNS/blob/master/LICENSE
# Notes: 

include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip

pypdns:
  pip.installed:
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.python2-pip
