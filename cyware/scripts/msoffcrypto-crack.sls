# Name: msoffcrypto-crack.py
# Website: https://blog.didierstevens.com/2018/12/31/new-tool-msoffcrypto-crack-py/
# Description: Recover the password of an encrypted Microsoft Office document.
# Category: Analyze Documents: Microsoft Office
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes: 

include:
  - cyware.python3-packages.msoffcrypto-tool

cyware-scripts-msoffcrypto-crack-source:
  file.managed:
    - name: /usr/local/src/cyware/files/msoffcrypto-crack_V0_0_5.zip
    - source: https://didierstevens.com/files/software/msoffcrypto-crack_V0_0_5.zip
    - source_hash: sha256=FEEFDD89134083EA19936494C8FCBD05804B3B9C0D4C5FBAFE06578D466B50AE
    - makedirs: True
    - require:
      - sls: cyware.python3-packages.msoffcrypto-tool

cyware-scripts-msoffcrypto-crack-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/msoffcrypto-crack_V0_0_5
    - source: /usr/local/src/cyware/files/msoffcrypto-crack_V0_0_5.zip
    - enforce_toplevel: False
    - require:
      - file: cyware-scripts-msoffcrypto-crack-source

cyware-scripts-msoffcrypto-crack-binary:
  file.managed:
    - name: /usr/local/bin/msoffcrypto-crack.py
    - source: /usr/local/src/cyware/msoffcrypto-crack_V0_0_5/msoffcrypto-crack.py
    - mode: 755
    - require:
      - archive: cyware-scripts-msoffcrypto-crack-archive

cyware-scripts-msoffcrypto-crack-formatting:
  file.replace:
    - name: /usr/local/bin/msoffcrypto-crack.py
    - pattern: '\r'
    - repl: ''
    - backup: false
    - require:
      - file: cyware-scripts-msoffcrypto-crack-binary

cyware-scripts-msoffcrypto-crack-shebang:
  file.replace:
    - name: /usr/local/bin/msoffcrypto-crack.py
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/env python3'
    - prepend_if_not_found: False
    - backup: false
    - count: 1
    - require:
      - file: cyware-scripts-msoffcrypto-crack-formatting
