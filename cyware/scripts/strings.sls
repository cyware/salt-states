# Name: strings.py
# Website: https://blog.didierstevens.com/2018/12/09/release-strings-py/
# Description: Extract strings.
# Category: Analyze Documents: Microsoft Office, Examine Static Properties: General
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes:

include:
  - cyware.packages.python3

cyware-scripts-strings-source:
  file.managed:
    - name: /usr/local/src/cyware/files/strings_V0_0_8.zip
    - source: https://didierstevens.com/files/software/strings_V0_0_8.zip
    - source_hash: 449AC9AA39A464D7C5883DED3FE9CB21A2E8E700F7763AD4199C25D37DCBD296
    - makedirs: True
    - require:
      - sls: cyware.packages.python3

cyware-scripts-strings-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/strings_V0_0_8
    - source: /usr/local/src/cyware/files/strings_V0_0_8.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-scripts-strings-source

cyware-scripts-strings-shebang:
  file.replace:
    - name: /usr/local/src/cyware/strings_V0_0_8/strings.py
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/env python3'
    - prepend_if_not_found: False
    - backup: false
    - count: 1
    - require:
      - archive: cyware-scripts-strings-archive

cyware-scripts-strings-binary:
  file.managed:
    - name: /usr/local/bin/strings.py
    - source: /usr/local/src/cyware/strings_V0_0_8/strings.py
    - mode: 755
    - watch:
      - file: cyware-scripts-strings-shebang
