# Name: decode-vbe.py
# Website: https://blog.didierstevens.com/2016/03/29/decoding-vbe/
# Description: Decode encoded VBS scripts (VBE).
# Category: Statically Analyze Code: Scripts
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes:

include:
  - cyware.packages.python3

cyware-scripts-decode-vbe-source:
  file.managed:
    - name: /usr/local/src/cyware/files/decode-vbe_V0_0_2.zip
    - source: https://didierstevens.com/files/software/decode-vbe_V0_0_2.zip
    - source_hash: 91A7465FE1F4D291751E6C5D88C51888C914B40C6F187709E33343FF121A116F
    - makedirs: True
    - require:
      - sls: cyware.packages.python3

cyware-scripts-decode-vbe-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/decode-vbe_V0_0_2
    - source: /usr/local/src/cyware/files/decode-vbe_V0_0_2.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-scripts-decode-vbe-source

cyware-scripts-decode-vbe-shebang:
  file.replace:
    - name: /usr/local/src/cyware/decode-vbe_V0_0_2/decode-vbe.py
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/env python3'
    - prepend_if_not_found: False
    - backup: false
    - count: 1
    - require:
      - archive: cyware-scripts-decode-vbe-archive

cyware-scripts-decode-vbe-binary:
  file.managed:
    - name: /usr/local/bin/decode-vbe.py
    - source: /usr/local/src/cyware/decode-vbe_V0_0_2/decode-vbe.py
    - mode: 755
    - watch:
      - file: cyware-scripts-decode-vbe-shebang