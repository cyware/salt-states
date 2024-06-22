# Name: de4dot
# Website: https://github.com/0xd4d/de4dot
# Description: Deobfuscate and unpack .NET programs.
# Category: Statically Analyze Code: .NET
# Author: 0xd4d
# License: GNU General Public License (GPL) v3.0: https://github.com/0xd4d/de4dot/blob/master/COPYING
# Notes: 

include:
  - cyware.repos.microsoft
  - cyware.packages.dotnet-runtime-3-1

cyware-tools-de4dot-source:
  file.managed:
    - name: /usr/local/src/cyware/files/de4dot-netcoreapp3.1.zip
    - source: https://github.com/cyware/distro/raw/master/files/de4dot-netcoreapp3.1.zip
    - source_hash: sha256=50a4bc95591742beb6d65d7a6d5a22f3861d6f9340af0fa20ba733437dc6e003
    - makedirs: true
    - require:
      - sls: cyware.packages.dotnet-runtime-3-1

cyware-tools-de4dot-archive:
  archive.extracted:
    - name: /usr/local/de4dot
    - source: /usr/local/src/cyware/files/de4dot-netcoreapp3.1.zip
    - enforce_toplevel: false
    - watch:
      - file: cyware-tools-de4dot-source

cyware-tools-de4dot-wrapper:
  file.managed:
    - name: /usr/local/bin/de4dot
    - mode: 755
    - watch:
      - archive: cyware-tools-de4dot-archive
    - contents:
      - '#!/bin/bash'
      - dotnet /usr/local/de4dot/de4dot.dll ${*}