# Name: rtfdump
# Website: https://blog.didierstevens.com/2018/12/10/update-rtfdump-py-version-0-0-9/
# Description: Analyze a suspicious RTF file.
# Category: Analyze Documents: Microsoft Office
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes: rtfdump.py

include:
  - cyware.packages.python3

cyware-scripts-rtfdump-source:
  file.managed:
    - name: /usr/local/src/cyware/files/rtfdump_V0_0_11.zip
    - source: https://didierstevens.com/files/software/rtfdump_V0_0_11.zip
    - source_hash: sha256=CB3984924137897F75E62C3A835BB9197CBF1DDBD6BCFB3E18423999B06A36C8
    - makedirs: True
    - require:
      - sls: cyware.packages.python3

cyware-scripts-rtfdump-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/rtfdump_V0_0_11
    - source: /usr/local/src/cyware/files/rtfdump_V0_0_11.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-scripts-rtfdump-source

cyware-scripts-rtfdump-binary:
  file.managed:
    - name: /usr/local/bin/rtfdump.py
    - source: /usr/local/src/cyware/rtfdump_V0_0_11/rtfdump.py
    - mode: 755
    - watch:
      - archive: cyware-scripts-rtfdump-archive

cyware-scripts-rtfdump-shebang:
  file.replace:
    - name: /usr/local/bin/rtfdump.py
    - pattern: '#!/usr/bin/env python'
    - repl: '#!/usr/bin/env python3'
    - backup: False
    - count: 1
    - require:
      - file: cyware-scripts-rtfdump-binary