# Name: ExtractScripts
# Website: https://blog.didierstevens.com/programs/extractscripts/
# Description: Extract scripts from HTML files.
# Category: Statically Analyze Code: Scripts
# Author: Didier Stevens
# License: Public Domain
# Notes: extractscripts.py

cyware-scripts-extractscripts-source:
  file.managed:
    - name: /usr/local/src/cyware/files/extractscripts.zip
    - source: https://www.didierstevens.com/files/software/extractscripts.zip
    - makedirs: True
    - skip_verify: True

cyware-scripts-extractscripts-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/extractscripts
    - source: /usr/local/src/cyware/files/extractscripts.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-scripts-extractscripts-source

cyware-scripts-extractscripts-binary:
  file.managed:
    - name: /usr/local/bin/extractscripts.py
    - source: /usr/local/src/cyware/extractscripts/extractscripts.py
    - mode: 755
    - watch:
      - archive: cyware-scripts-extractscripts-archive

cyware-scripts-extractscripts-shebang:
  file.replace:
    - name: /usr/local/bin/extractscripts.py
    - pattern: '#!/usr/bin/python\n'
    - repl: '#!/usr/bin/env python2\n'
    - backup: False
    - count: 1
    - require:
      - file: cyware-scripts-extractscripts-binary
