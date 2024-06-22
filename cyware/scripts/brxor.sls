# Name: brxor.py
# Website: https://github.com/cyware/distro/blob/master/files/brxor.py
# Description: Bruteforce XOR'ed strings to find those that are English words.
# Category: Examine Static Properties: Deobfuscation
# Author: Alexander Hanel, Trenton Tait
# License: Free, unknown license
# Notes: 

include:
  - cyware.packages.enchant
  - cyware.python-packages.pyenchant

cyware-scripts-brxor-source:
  file.managed:
    - name: /usr/local/bin/brxor.py
    - source: https://github.com/cyware/distro/raw/master/files/brxor.py
    - source_hash: sha256=f9973f999a01dc7ab3f7f6a4a21df4224d4068b6dcdd8de2aaab4fe1be200d18
    - makedirs: false
    - mode: 755
    - require:
      - sls: cyware.packages.enchant
      - sls: cyware.python-packages.pyenchant

cyware-scripts-brxor-shebang:
  file.replace:
    - name: /usr/local/bin/brxor.py
    - pattern: '#!/usr/bin/python'
    - repl: '#!/usr/bin/env python2'
    - count: 1
    - backup: False
    - prepend_if_not_found: False
    - watch:
      - file: cyware-scripts-brxor-source

