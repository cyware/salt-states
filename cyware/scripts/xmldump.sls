# Name: xmldump.py
# Website: https://blog.didierstevens.com/2017/12/18/new-tool-xmldump-py/
# Description: Extract contents of XML files, in particular OOXML-formatted Microsoft Office documents.
# Category: Analyze Documents: Microsoft Office
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes:

include:
  - cyware.packages.python3

cyware-scripts-xmldump-source:
  file.managed:
    - name: /usr/local/src/cyware/files/xmldump_V0_0_7.zip
    - source: https://didierstevens.com/files/software/xmldump_V0_0_7.zip
    - source_hash: 0d7850ceedeb7efd9e8645cf8dd59f1912e9eb3c135346f98af3e3a7baae2b68
    - makedirs: True
    - require:
      - sls: cyware.packages.python3

cyware-scripts-xmldump-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/xmldump_V0_0_7
    - source: /usr/local/src/cyware/files/xmldump_V0_0_7.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-scripts-xmldump-source

cyware-scripts-xmldump-shebang:
  file.replace:
    - name: /usr/local/src/cyware/xmldump_V0_0_7/xmldump.py
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/env python3'
    - prepend_if_not_found: False
    - backup: false
    - count: 1
    - require:
      - archive: cyware-scripts-xmldump-archive

cyware-scripts-xmldump-binary:
  file.managed:
    - name: /usr/local/bin/xmldump.py
    - source: /usr/local/src/cyware/xmldump_V0_0_7/xmldump.py
    - mode: 755
    - watch:
      - file: cyware-scripts-xmldump-shebang
