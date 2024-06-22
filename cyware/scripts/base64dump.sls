# Name: base64dump
# Website: https://blog.didierstevens.com/2020/07/03/update-base64dump-py-version-0-0-12/
# Description: Locate and decode strings encoded in Base64 and other common encodings.
# Category: Examine Static Properties: Deobfuscation, Analyze Documents: General
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes: base64dump.py

include:
  - cyware.packages.python3

cyware-scripts-base64dump-source:
  file.managed:
    - name: /usr/local/src/cyware/files/base64dump_V0_0_22.zip
    - source: https://didierstevens.com/files/software/base64dump_V0_0_22.zip
    - source_hash: sha256=32695EEDDADAE9B1AFA1CAA70A69E2A0434E2264CEF836DE172BC5254C8E6281
    - makedirs: True
    - require:
      - sls: cyware.packages.python3

cyware-scripts-base64dump-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/base64dump_V0_0_22
    - source: /usr/local/src/cyware/files/base64dump_V0_0_22.zip
    - enforce_toplevel: False
    - require:
      - file: cyware-scripts-base64dump-source

cyware-scripts-base64dump-binary:
  file.managed:
    - name: /usr/local/bin/base64dump.py
    - source: /usr/local/src/cyware/base64dump_V0_0_22/base64dump.py
    - mode: 755
    - require:
      - archive: cyware-scripts-base64dump-archive

cyware-scripts-base64dump-shebang:
  file.replace:
    - name: /usr/local/bin/base64dump.py
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/env python3'
    - backup: False
    - count: 1
    - require:
      - file: cyware-scripts-base64dump-binary