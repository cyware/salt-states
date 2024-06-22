# Name: translate.py
# Website: https://blog.didierstevens.com/programs/translate/
# Description: Translate bytes according to a Python expression.
# Category: Examine Static Properties: Deobfuscation
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes:

include:
  - cyware.packages.python3

cyware-scripts-translate-source:
  file.managed:
    - name: /usr/local/src/cyware/files/translate_v2_5_12.zip
    - source: https://didierstevens.com/files/software/translate_v2_5_12.zip
    - source_hash: 899109A9D787D6781AEB0569330A01709063BB3FD58F4AED068A57951B230F88
    - makedirs: True
    - require:
      - sls: cyware.packages.python3

cyware-scripts-translate-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/translate_v2_5_12
    - source: /usr/local/src/cyware/files/translate_v2_5_12.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-scripts-translate-source

cyware-scripts-translate-binary:
  file.managed:
    - name: /usr/local/bin/translate.py
    - source: /usr/local/src/cyware/translate_v2_5_12/translate.py
    - mode: 755
    - watch:
      - archive: cyware-scripts-translate-archive

cyware-scripts-translate-shebang:
  file.replace:
    - name: /usr/local/bin/translate.py
    - pattern: '#!/usr/bin/env python'
    - repl: '#!/usr/bin/env python3'
    - backup: false
    - count: 1
    - require:
      - file: cyware-scripts-translate-binary
