# Name: pecheck
# Website: https://blog.didierstevens.com/2020/03/15/pecheck-py-version-0-7-10/
# Description: Analyze static properties of PE files.
# Category: Examine Static Properties: PE Files
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes: pecheck.py

include:
  - cyware.python3-packages.pefile

cyware-scripts-pecheck-source:
  file.managed:
    - name: /usr/local/src/cyware/files/pecheck-v0_7_15.zip
    - source: https://didierstevens.com/files/software/pecheck-v0_7_15.zip
    - source_hash: 596848BC8BD03936604212E4CBE9545A03EE629BE6125D08A4E28068F1952961
    - makedirs: True
    - require:
      - sls: cyware.python3-packages.pefile

cyware-scripts-pecheck-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/pecheck-v0_7_15
    - source: /usr/local/src/cyware/files/pecheck-v0_7_15.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-scripts-pecheck-source

cyware-scripts-pecheck-binary:
  file.managed:
    - name: /usr/local/bin/pecheck.py
    - source: /usr/local/src/cyware/pecheck-v0_7_15/pecheck.py
    - mode: 755
    - watch:
      - archive: cyware-scripts-pecheck-archive

cyware-scripts-pecheck-shebang:
  file.replace:
    - name: /usr/local/bin/pecheck.py
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/env python3'
    - prepend_if_not_found: False
    - backup: false
    - count: 1
    - require:
      - file: cyware-scripts-pecheck-binary
