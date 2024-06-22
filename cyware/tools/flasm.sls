# Name: Flasm
# Website: http://www.nowrap.de/flasm.html
# Description: Extract and disassemble ActionScript from Flash (SWF) files.
# Category: Statically Analyze Code: Flash
# Author: Igor Kogan, Wang Zhen
# License: Freeware with some restrictions
# Notes: 

include:
  - cyware.packages.i386-architecture

cyware-tools-flasm-source:
  file.managed:
    - name: /usr/local/src/cyware/files/flasm16linux.tgz
    - source: http://www.nowrap.de/download/flasm16linux.tgz
    - source_hash: 88f16edcdee60773828107e6af16265a21bd577cf6acbf374c7864d2b58d43cb
    - makedirs: True
    - require:
      - sls: cyware.packages.i386-architecture

cyware-tools-flasm-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/flasm16linux
    - source: /usr/local/src/cyware/files/flasm16linux.tgz
    - enforce_toplevel: False
    - watch:
      - file: cyware-tools-flasm-source

cyware-tools-flasm-binary:
  file.managed:
    - name: /usr/local/bin/flasm
    - source: /usr/local/src/cyware/flasm16linux/flasm
    - mode: 755
    - watch:
      - archive: cyware-tools-flasm-archive
