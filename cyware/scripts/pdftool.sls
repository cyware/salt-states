# Name: pdftool.py
# Website: https://blog.didierstevens.com/2021/01/31/new-tool-pdftool-py/
# Description: Analyze PDF files to identify incremental updates to the document.
# Category: Analyze Documents: PDF
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes:

include:
  - cyware.packages.python3

cyware-scripts-pdftool-source:
  file.managed:
    - name: /usr/local/src/cyware/files/pdftool_V0_0_1.zip
    - source: https://didierstevens.com/files/software/pdftool_V0_0_1.zip
    - source_hash: 401E88FBFAEC4382A50FE59430D04FE6111F9911958AB09BA7530C26043FDA87
    - makedirs: True
    - require:
      - sls: cyware.packages.python3

cyware-scripts-pdftool-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/pdftool_V0_0_1
    - source: /usr/local/src/cyware/files/pdftool_V0_0_1.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-scripts-pdftool-source

cyware-scripts-pdftool-shebang:
  file.replace:
    - name: /usr/local/src/cyware/pdftool_V0_0_1/pdftool.py
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/env python3'
    - prepend_if_not_found: False
    - backup: false
    - count: 1
    - require:
      - archive: cyware-scripts-pdftool-archive

cyware-scripts-pdftool-binary:
  file.managed:
    - name: /usr/local/bin/pdftool.py
    - source: /usr/local/src/cyware/pdftool_V0_0_1/pdftool.py
    - mode: 755
    - watch:
      - file: cyware-scripts-pdftool-shebang
