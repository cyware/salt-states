# Name: emldump
# Website: https://blog.didierstevens.com/2020/11/29/update-emldump-py-version-0-0-11/
# Description: Parse and analyze EML files.
# Category: Analyze Documents: Email Messages
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Free, unknown license
# Notes: 

include:
  - cyware.python3-packages.yara-python3

cyware-scripts-emldump-source:
  file.managed:
    - name: /usr/local/src/cyware/files/emldump_V0_0_13.zip
    - source: https://didierstevens.com/files/software/emldump_V0_0_13.zip
    - source_hash: sha256=2812EFFCBD9BDCA2634210678C1F2508216E099D94531E5FF29BFE32B3B12B65
    - makedirs: True

cyware-scripts-emldump-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/emldump-0.0.13
    - source: /usr/local/src/cyware/files/emldump_V0_0_13.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-scripts-emldump-source

cyware-scripts-emldump-binary:
  file.managed:
    - name: /usr/local/bin/emldump.py
    - source: /usr/local/src/cyware/emldump-0.0.13/emldump.py
    - mode: 755
    - require:
      - sls: cyware.python3-packages.yara-python3
    - watch:
      - archive: cyware-scripts-emldump-archive

cyware-scripts-emldump-shebang:
  file.replace:
    - name: /usr/local/bin/emldump.py
    - pattern: '#!/usr/bin/env python\n'
    - repl: '#!/usr/bin/env python3\n'
    - backup: False
    - count: 1
    - require:
      - file: cyware-scripts-emldump-binary
