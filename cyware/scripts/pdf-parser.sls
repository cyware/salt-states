# Name: pdf-parser.py
# Website: https://blog.didierstevens.com/programs/pdf-tools/
# Description: Examine elements of the PDF file.
# Category: Analyze Documents: PDF
# Author: Didier Stevens 
# License: Public Domain
# Notes:

include:
  - cyware.python-packages.yara-python

cyware-scripts-pdf-parser-source:
  file.managed:
    - name: /usr/local/src/cyware/files/pdf-parser_V0_7_6.zip
    - source: https://didierstevens.com/files/software/pdf-parser_V0_7_6.zip
    - source_hash: sha256=34379A9987B2286706AF4C43AC72C93611AE3E9C0C571DD729EBB09C7A707A0D
    - makedirs: True

cyware-scripts-pdf-parser-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/pdf-parser_V0_7_6
    - source: /usr/local/src/cyware/files/pdf-parser_V0_7_6.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-scripts-pdf-parser-source

cyware-scripts-pdf-parser-binary:
  file.managed:
    - name: /usr/local/bin/pdf-parser.py
    - source: /usr/local/src/cyware/pdf-parser_V0_7_6/pdf-parser.py
    - mode: 755
    - require:
      - sls: cyware.python-packages.yara-python
    - watch:
      - archive: cyware-scripts-pdf-parser-archive

cyware-scripts-pdf-parser-shebang:
  file.replace:
    - name: /usr/local/bin/pdf-parser.py
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/env python3'
    - backup: False
    - count: 1
    - require:
      - file: cyware-scripts-pdf-parser-binary

cyware-scripts-pdf-parser-python-version:
  file.replace:
    - name: /usr/local/bin/pdf-parser.py
    - pattern: '^__maximum_python_version__ = \(3, 7, 5\)$'
    - repl: '__maximum_python_version__ = (3, 8, 10)'
    - backup: False
    - count: 1
    - require:
      - file: cyware-scripts-pdf-parser-shebang