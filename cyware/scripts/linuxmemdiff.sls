# Name: linux_mem_diff_tool
# Website: https://github.com/monnappa22/linux_mem_diff_tool
# Description: Compare two memory images of Linux systems by using Volatility.
# Category: Perform Memory Forensics
# Author: Monnappa K A
# License: Free, unknown license
# Notes: linux_mem_diff.py

include:
  - cyware.python-packages.volatility

cyware-linuxmemdiff-source:
  file.managed:
    - name: /usr/local/bin/linux_mem_diff.py
    - source: https://github.com/monnappa22/linux_mem_diff_tool/raw/master/linux_mem_diff.py
    - source_hash: sha256=7e0f5dc793e3611eca50a5561bf19a6d8a7e1ad5edfeec66bccdb2aff5395fb2
    - mode: 755

cyware-linuxmemdiff-shebang:
  file.prepend:
    - name: /usr/local/bin/linux_mem_diff.py
    - text: '#!/usr/bin/env python2'
    - require:
      - file: cyware-linuxmemdiff-source
    - watch:
      - file: cyware-linuxmemdiff-source

cyware-linuxmemdiff-python-path:
  file.replace:
    - name: /usr/local/bin/linux_mem_diff.py
    - pattern: "python_path = r''"
    - repl: "python_path = r'/usr/bin/python'"
    - backup: False
    - count: 1
    - require:
      - file: cyware-linuxmemdiff-source
    - watch:
      - file: cyware-linuxmemdiff-shebang

cyware-linuxmemdiff-vol-path:
  file.replace:
    - name: /usr/local/bin/linux_mem_diff.py
    - pattern: "vol_path = r''"
    - repl: "vol_path = r'/usr/local/bin/vol.py'"
    - backup: False
    - count: 1
    - require:
      - file: cyware-linuxmemdiff-source
    - watch:
      - file: cyware-linuxmemdiff-python-path
