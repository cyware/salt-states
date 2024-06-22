# Name: virustotal-search
# Website: https://blog.didierstevens.com/programs/virustotal-tools/
# Description: Search VirusTotal for file hashes.
# Category: Gather and Analyze Data
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes: virustotal-search.py

cyware-scripts-virustotal-search-source:
  file.managed:
    - name: /usr/local/src/cyware/files/virustotal-search_V0_1_7.zip
    - source: https://didierstevens.com/files/software/virustotal-search_V0_1_7.zip
    - source_hash: sha256=AEFEB5761A5BBEE998FA20A68213316522C7554796F47EB8C7EB2A5DF1D4E73D
    - makedirs: True

cyware-scripts-virustotal-search-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/virustotal-search_V0_1_7
    - source: /usr/local/src/cyware/files/virustotal-search_V0_1_7.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-scripts-virustotal-search-source

cyware-scripts-virustotal-search-binary:
  file.managed:
    - name: /usr/local/bin/virustotal-search.py
    - source: /usr/local/src/cyware/virustotal-search_V0_1_7/virustotal-search.py
    - mode: 755
    - watch:
      - archive: cyware-scripts-virustotal-search-archive

cyware-scripts-virustotal-search-shebang:
  file.replace:
    - name: /usr/local/bin/virustotal-search.py
    - pattern: '#!/usr/bin/env python\n'
    - repl: '#!/usr/bin/env python3'
    - backup: False
    - count: 1
    - require:
      - file: cyware-scripts-virustotal-search-binary
