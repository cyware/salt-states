# Name: zipdump.py
# Website: https://blog.didierstevens.com/2020/07/27/update-zipdump-py-version-0-0-20/
# Description: Analyze zip-compressed files.
# Category: Analyze Documents: Microsoft Office, Examine Static Properties: General
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes:

include:
  - cyware.packages.python3

cyware-scripts-zipdump-source:
  file.managed:
    - name: /usr/local/src/cyware/files/zipdump_v0_0_29.zip
    - source: https://didierstevens.com/files/software/zipdump_v0_0_29.zip
    - source_hash: 9D89DCAF531621E33A0A36D1EA519A62F1004A762C0789C857976033A32E7F8A
    - makedirs: True
    - require:
      - sls: cyware.packages.python3

cyware-scripts-zipdump-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/zipdump_v0_0_29
    - source: /usr/local/src/cyware/files/zipdump_v0_0_29.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-scripts-zipdump-source

cyware-scripts-zipdump-shebang:
  file.replace:
    - name: /usr/local/src/cyware/zipdump_v0_0_29/zipdump.py
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/env python3'
    - prepend_if_not_found: False
    - backup: false
    - count: 1
    - require:
      - archive: cyware-scripts-zipdump-archive

cyware-scripts-zipdump-binary:
  file.managed:
    - name: /usr/local/bin/zipdump.py
    - source: /usr/local/src/cyware/zipdump_v0_0_29/zipdump.py
    - mode: 755
    - watch:
      - file: cyware-scripts-zipdump-shebang
