# Name: TrID
# Website: https://mark0.net/soft-trid-e.html
# Description: Identify file type using signatures.
# Category: Examine Static Properties: General, Statically Analyze Code: Unpacking
# Author: Marco Pontello
# License: Free, unknown license
# Notes: trid, tridupdate

cyware-tools-trid-source:
  file.managed:
    - name: /usr/local/src/cyware/files/trid_linux_64.zip
    - source: https://mark0.net/download/trid_linux_64.zip
    - source_hash: sha256=3fb9ccfed650123f7bb5fc5a93ccbfcbc6ff98876cc659c8958c03a582467aa9
    - makedirs: True

cyware-tools-tridupdate-source:
  file.managed:
    - name: /usr/local/src/cyware/files/tridupdate.zip
    - source: https://mark0.net/download/tridupdate.zip
    - source_hash: sha256=3596167b5fa2f4adb3b6ee013c3f111a5c9e3b52f948e70e27423d8e69a1bb12
    - require:
      - file: cyware-tools-trid-source
    - watch:
      - file: cyware-tools-trid-source

cyware-tools-trid-archive:
  archive.extracted:
    - name: /usr/local/trid_linux_64
    - source: /usr/local/src/cyware/files/trid_linux_64.zip
    - enforce_toplevel: False
    - require:
      - file: cyware-tools-trid-source
    - watch:
      - file: cyware-tools-tridupdate-source

cyware-tools-tridupdate-archive:
  archive.extracted:
    - name: /usr/local/trid_linux_64
    - source: /usr/local/src/cyware/files/tridupdate.zip
    - enforce_toplevel: False
    - require:
      - file: cyware-tools-tridupdate-source
    - watch:
      - archive: cyware-tools-trid-archive

cyware-tools-tridfiles-mode:
  file.managed:
    - names:
      - /usr/local/trid_linux_64/trid
      - /usr/local/trid_linux_64/tridupdate.py
    - mode: 755
    - watch:
      - archive: cyware-tools-tridupdate-archive

cyware-tools-tridupdate-formatting:
  file.replace:
    - name: /usr/local/trid_linux_64/tridupdate.py
    - pattern: '\r'
    - repl: ''
    - require:
      - archive: cyware-tools-tridupdate-archive

cyware-tools-tridupdate-shebang:
  file.replace:
    - name: /usr/local/trid_linux_64/tridupdate.py
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/env python3\n'
    - prepend_if_not_found: False
    - count: 1
    - require:
      - archive: cyware-tools-tridupdate-archive

cyware-tools-tridupdate-defs-location:
  file.replace:
    - name: /usr/local/trid_linux_64/tridupdate.py
    - pattern: 'default="triddefs.trd"'
    - repl: 'default="/usr/local/trid_linux_64/triddefs.trd"'
    - count: 1
    - require:
      - archive: cyware-tools-tridupdate-archive

cyware-tools-trid-wrapper:
  file.managed:
    - name: /usr/local/bin/trid
    - mode: 755
    - replace: False
    - watch:
      - file: cyware-tools-tridfiles-mode
    - contents:
      - '#!/bin/bash'
      - LC_CTYPE=C.UTF-8 /usr/local/trid_linux_64/trid ${*}

/usr/local/bin/tridupdate:
  file.symlink:
    - target: /usr/local/trid_linux_64/tridupdate.py
    - watch:
      - file: cyware-tools-tridfiles-mode

cyware-tools-tridupdate-run:
  cmd.wait:
    - name: /usr/bin/python3 /usr/local/bin/tridupdate
    - watch:
      - file: /usr/local/bin/tridupdate
