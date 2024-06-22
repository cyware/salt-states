# Name: SSView
# Website: https://www.mitec.cz/ssv.html
# Description: Analyze OLE2 Structured Storage files
# Category: Analyze Documents: Microsoft Office
# Author: Michal Mutl
# License: Free to use for private, educational and non-commercial purposes.
# Notes: ssview

include:
  - cyware.packages.wine

cyware-tools-ssview-source:
  file.managed:
    - name: /usr/local/src/cyware/files/SSView.zip
    - source: https://www.mitec.cz/Downloads/SSView.zip
    - source_hash: e9d05067745a4f114b22dc798c7fa99017302b39bc8798853ed1bfd4c44d27ab
    - makedirs: True
    - require:
      - sls: cyware.packages.wine

cyware-tools-ssview-archive:
  archive.extracted:
    - name: /usr/local/ssview
    - source: /usr/local/src/cyware/files/SSView.zip
    - enforce_toplevel: False
    - watch:
      - file: cyware-tools-ssview-source

cyware-tools-ssview-wrapper:
  file.managed:
    - name: /usr/local/bin/ssview
    - mode: 755
    - watch:
      - archive: cyware-tools-ssview-archive
    - contents:
      - '#!/bin/bash'
      - wine /usr/local/ssview/SSView.exe ${*}
