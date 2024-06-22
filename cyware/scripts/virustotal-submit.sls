# Name: virustotal-submit
# Website: https://blog.didierstevens.com/programs/virustotal-tools/
# Description: Submit files to VirusTotal.
# Category: Gather and Analyze Data
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes: virustotal-submit.py

include:
  - cyware.python-packages.poster

cyware-scripts-virustotal-submit-source:
  file.managed:
    - name: /usr/local/src/cyware/files/virustotal-submit_V0_0_3.zip
    - source: http://didierstevens.com/files/software/virustotal-submit_V0_0_3.zip
    - source_hash: sha256=37CCE3E8469DE097912CB23BAC6B909C9C7F5A5CEE09C9279D32BDB9D6E23BCC
    - makedirs: True

cyware-scripts-virustotal-submit-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/virustotal-submit_V0_0_3
    - source: /usr/local/src/cyware/files/virustotal-submit_V0_0_3.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-scripts-virustotal-submit-source

cyware-scripts-virustotal-submit-binary:
  file.managed:
    - name: /usr/local/bin/virustotal-submit.py
    - source: /usr/local/src/cyware/virustotal-submit_V0_0_3/virustotal-submit.py
    - mode: 755
    - require:
      - sls: cyware.python-packages.poster
    - watch:
      - archive: cyware-scripts-virustotal-submit-archive

cyware-scripts-virustotal-submit-shebang:
  file.replace:
    - name: /usr/local/bin/virustotal-submit.py
    - pattern: '#!/usr/bin/env python\n'
    - repl: '#!/usr/bin/env python2\n'
    - backup: False
    - count: 1
    - require:
      - file: cyware-scripts-virustotal-submit-binary
