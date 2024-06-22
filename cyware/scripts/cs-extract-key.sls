# Name: cyware.scripts.cs-extract-key.py
# Website: https://blog.didierstevens.com/2021/11/03/new-tool-cs-extract-key-py/
# Description: Extract cryptographic keys from Cobalt Strike beacon process memory dumps.
# Category: Examine Static Properties: Deobfuscation
# Author: Didier Stevens: https://twitter.com/DidierStevens
# License: Public Domain
# Notes: 

{%- set archivename="cs-extract-key_V0_0_1.zip" %}
{%- set dirname="cs-extract-key_V0_0_1" %}
{%- set url="https://didierstevens.com/files/software/cs-extract-key_V0_0_1.zip" %}
{%- set hash="BBEDF6CBFFF51669187694F463C32A49F53420BEDF8B76508D06850643DE334F" %}

include:
  - cyware.python3-packages.pycryptodome

cyware-scripts-cs-extract-key-source:
  file.managed:
    - name: /usr/local/src/cyware/files/{{ archivename }}
    - source: {{ url }}
    - source_hash: {{ hash }}
    - makedirs: True
    - require:
      - sls: cyware.python3-packages.pycryptodome

cyware-scripts-cs-extract-key-archive:
  archive.extracted:
    - name: /usr/local/src/cyware/{{ dirname }}
    - source: /usr/local/src/cyware/files/{{ archivename }}
    - enforce_toplevel: False
    - require:
      - file: cyware-scripts-cs-extract-key-source

cyware-scripts-cs-extract-key-binary:
  file.managed:
    - name: /usr/local/bin/cs-extract-key.py
    - source: /usr/local/src/cyware/{{ dirname }}/cs-extract-key.py
    - mode: 755
    - require:
      - archive: cyware-scripts-cs-extract-key-archive

cyware-scripts-cs-extract-key-shebang:
  file.replace:
    - name: /usr/local/bin/cs-extract-key.py
    - pattern: '#!/usr/bin/env python\n'
    - repl: '#!/usr/bin/env python3\n'
    - backup: False
    - count: 1
    - require:
      - file: cyware-scripts-cs-extract-key-binary