# Name: PEframe
# Website: https://github.com/digitalsleuth/peframe
# Description: Statically analyze PE and Microsoft Office files.
# Category: Examine Static Properties: PE Files
# Author: Gianni Amato: https://twitter.com/guelfoweb
# License: Free, unknown license
# Notes: peframe

include:
  - cyware.packages.libssl-dev
  - cyware.packages.swig
  - cyware.python3-packages.pip

cyware-python3-packages-peframe-remove:
  pip.removed:
    - name: peframe
    - bin_env: /usr/bin/python3
    - require:
      - sls: cyware.python3-packages.pip

cyware-python3-packages-peframe:
  pip.installed:
    - name: peframe-ds
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.packages.libssl-dev
      - sls: cyware.packages.swig
      - sls: cyware.python3-packages.pip
