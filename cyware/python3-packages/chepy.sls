# Name: Chepy
# Website: https://github.com/securisec/chepy
# Description: Decode and otherwise analyze data using this command-line tool and Python library.
# Category: Examine Static Properties: Deobfuscation
# Author: Hapsida Securisec: https://twitter.com/securisec
# License: GNU General Public License (GPL) v3: https://github.com/securisec/chepy/blob/master/LICENSE
# Notes: chepy

include:
  - cyware.python3-packages.pip
  - cyware.python3-packages.pycryptodome

cyware-python3-packages-chepy:
  pip.installed:
    - name: chepy
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip    
      - sls: cyware.python3-packages.pycryptodome

cyware-python3-packages-chepy-extras:
  pip.installed:
    - name: chepy[extras]
    - bin_env: /usr/bin/python3
    - upgrade: True
    - watch:
      - pip: cyware-python3-packages-chepy
