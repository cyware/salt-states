# Name: re-search.py
# Website: https://blog.didierstevens.com/2021/05/23/update-re-search-py-version-0-0-17/
# Description: Search the file for built-in regular expressions of common suspicious artifacts.
# Category: Examine Static Properties: General
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes: 

include:
  - cyware.packages.python3

cyware-scripts-re-search-source:
  file.managed:
    - name: /usr/local/src/cyware/files/re-search_V0_0_21.zip
    - source: https://didierstevens.com/files/software/re-search_V0_0_21.zip
    - source_hash: sha256=B818CE4F7E217B381128550A3A36B40B6D07CC687CE4CF5AFF3C70EC0D3EEAD2
    - makedirs: True
    - require:
      - sls: cyware.packages.python3

cyware-scripts-re-search-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/re-search_V0_0_21
    - source: /usr/local/src/cyware/files/re-search_V0_0_21.zip
    - enforce_toplevel: False
    - require:
      - file: cyware-scripts-re-search-source

cyware-scripts-re-search-binary:
  file.managed:
    - name: /usr/local/bin/re-search.py
    - source: /usr/local/src/cyware/re-search_V0_0_21/re-search.py
    - mode: 755
    - require:
      - archive: cyware-scripts-re-search-archive

cyware-scripts-re-search-shebang:
  file.replace:
    - name: /usr/local/bin/re-search.py
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/env python3'
    - backup: False
    - count: 1
    - require:
      - file: cyware-scripts-re-search-binary

cyware-scripts-re-search-reextra:
  file.managed:
    - name: /usr/local/bin/reextra.py
    - source: /usr/local/src/cyware/re-search_V0_0_21/reextra.py
    - mode: 644
    - require:
      - archive: cyware-scripts-re-search-archive