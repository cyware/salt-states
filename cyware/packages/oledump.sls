# Name: oledump
# Website: https://blog.didierstevens.com/programs/oledump-py/
# Description: Analyze OLE2 Structured Storage files.
# Category: Analyze Documents: Microsoft Office
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes: oledump.py

include:
  - cyware.python3-packages.yara-python3
  - cyware.python3-packages.olefile
  - cyware.python3-packages.pyzipper
  - cyware.repos.cyware

cyware-packages-oledump:
  pkg.installed:
    - name: oledump
    - version: latest
    - upgrade: True
    - pkgrepo: cyware
    - require:
      - sls: cyware.python3-packages.yara-python3
      - sls: cyware.python3-packages.olefile
      - sls: cyware.python3-packages.pyzipper