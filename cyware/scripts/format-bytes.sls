# Name: format-bytes.py
# Website: https://blog.didierstevens.com/2020/02/17/update-format-bytes-py-version-0-0-13/
# Description: Decompose structured binary data with format strings.
# Category: Examine Static Properties: Deobfuscation
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes: 

include:
  - cyware.packages.python3

cyware-scripts-format-bytes-source:
  file.managed:
    - name: /usr/local/src/cyware/files/format-bytes_V0_0_13.zip
    - source: https://didierstevens.com/files/software/format-bytes_V0_0_13.zip
    - source_hash: 1F22A1D784DCF1269FFD12E2C9467EE0FB93B0895CC24D04CBBD9696D50945DB
    - makedirs: True
    - require:
      - sls: cyware.packages.python3

cyware-scripts-format-bytes-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/format-bytes_V0_0_13
    - source: /usr/local/src/cyware/files/format-bytes_V0_0_13.zip
    - enforce_toplevel: False
    - require:
      - file: cyware-scripts-format-bytes-source

cyware-scripts-format-bytes-binary:
  file.managed:
    - name: /usr/local/bin/format-bytes.py
    - source: /usr/local/src/cyware/format-bytes_V0_0_13/format-bytes.py
    - mode: 755
    - require:
      - archive: cyware-scripts-format-bytes-archive

cyware-scripts-format-bytes-shebang:
  file.replace:
    - name: /usr/local/bin/format-bytes.py
    - pattern: '#!/usr/bin/env python\n'
    - repl: '#!/usr/bin/env python3\n'
    - backup: False
    - count: 1
    - require:
      - file: cyware-scripts-format-bytes-binary

cyware-scripts-format-bytes-library:
  file.managed:
    - name: /usr/local/bin/format-bytes.library
    - source: /usr/local/src/cyware/format-bytes_V0_0_13/format-bytes.library
    - mode: 644
    - require:
      - archive: cyware-scripts-format-bytes-archive