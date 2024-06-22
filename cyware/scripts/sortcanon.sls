# Name: sortcanon.py
# Website: https://blog.didierstevens.com/2022/06/18/new-tool-sortcanon-py/
# Description: Sort text files using canonicalization functions built into this tool.
# Category: General Utilities
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes:

include:
  - cyware.packages.python3

cyware-scripts-sortcanon-source:
  file.managed:
    - name: /usr/local/src/cyware/files/sortcanon_V0_0_2.zip
    - source: https://didierstevens.com/files/software/sortcanon_V0_0_2.zip
    - source_hash: 190922F347AC1B32D0CE503D1763F27A250D9BFDD15CB911EA4435BAB7E69CD3
    - makedirs: True
    - require:
      - sls: cyware.packages.python3

cyware-scripts-sortcanon-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/sortcanon_V0_0_2
    - source: /usr/local/src/cyware/files/sortcanon_V0_0_2.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-scripts-sortcanon-source

cyware-scripts-sortcanon-shebang:
  file.replace:
    - name: /usr/local/src/cyware/sortcanon_V0_0_2/sortcanon.py
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/env python3'
    - prepend_if_not_found: False
    - backup: false
    - count: 1
    - require:
      - archive: cyware-scripts-sortcanon-archive

cyware-scripts-sortcanon-binary:
  file.managed:
    - name: /usr/local/bin/sortcanon.py
    - source: /usr/local/src/cyware/sortcanon_V0_0_2/sortcanon.py
    - mode: 755
    - watch:
      - file: cyware-scripts-sortcanon-shebang
