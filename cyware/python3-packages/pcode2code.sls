# Name: pcode2code
# Website: https://github.com/Big5-sec/pcode2code
# Description: Decompile VBA macro p-code from Microsoft Office documents
# Category: Analyze Documents: Microsoft Office
# Author: Nicolas Zilio: https://twitter.com/Big5_sec
# License: GNU General Public License (GPL) v3: https://github.com/Big5-sec/pcode2code/blob/master/LICENSE
# Notes: 

include:
  - cyware.python3-packages.pip

cyware-python3-packages-pcode2code:
  pip.installed:
    - name: pcode2code
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
