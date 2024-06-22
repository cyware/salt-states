# Name: dnsresolver.py
# Website: https://blog.didierstevens.com/2021/07/15/new-tool-dnsresolver-py/
# Description: Respond to DNS queries in a controlled way.
# Category: Explore Network Interactions: Services
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes:

include:
  - cyware.packages.python3
  - cyware.packages.python3-dnslib

cyware-scripts-dnsresolver-source:
  file.managed:
    - name: /usr/local/src/cyware/files/dnsresolver_V0_0_1.zip
    - source: https://didierstevens.com/files/software/dnsresolver_V0_0_1.zip
    - source_hash: 56AD87585FDCC20C219BF4A27D9640ECD563E4155816990AB4E7B85AAFA5F047
    - makedirs: True
    - require:
      - sls: cyware.packages.python3
      - sls: cyware.packages.python3-dnslib

cyware-scripts-dnsresolver-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/dnsresolver_V0_0_1
    - source: /usr/local/src/cyware/files/dnsresolver_V0_0_1.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-scripts-dnsresolver-source

cyware-scripts-dnsresolver-shebang:
  file.replace:
    - name: /usr/local/src/cyware/dnsresolver_V0_0_1/dnsresolver.py
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/env python3'
    - prepend_if_not_found: False
    - backup: false
    - count: 1
    - require:
      - archive: cyware-scripts-dnsresolver-archive

cyware-scripts-dnsresolver-binary:
  file.managed:
    - name: /usr/local/bin/dnsresolver.py
    - source: /usr/local/src/cyware/dnsresolver_V0_0_1/dnsresolver.py
    - mode: 755
    - watch:
      - file: cyware-scripts-dnsresolver-shebang