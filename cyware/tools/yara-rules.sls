# Name: Yara Rules
# Website: https://github.com/Yara-Rules/rules
# Description: Statically scan a file to identify common malicious capabilities.
# Category: Examine Static Properties: General
# Author: A group of IT security researchers: https://twitter.com/yararules
# License: GNU General Public License (GPL) v2: https://github.com/Yara-Rules/rules/blob/master/LICENSE
# Notes: To scan a file using these rules, you can use the wrapper around Yara: `yara-rules FILE`, where `FILE` is the path to the file you wish to scan.

include:
  - cyware.packages.git
  - cyware.packages.yara

cyware-tools-yara-rules:
  git.latest:
    - name: https://github.com/Yara-Rules/rules.git
    - target: /usr/local/yara-rules
    - user: root
    - branch: master
    - force_fetch: True
    - force_reset: True
    - force_checkout: True
    - require:
      - sls: cyware.packages.yara

cyware-tools-yara-rules-wrapper:
  file.managed:
    - name: /usr/local/bin/yara-rules
    - mode: 755
    - watch:
      - git: cyware-tools-yara-rules
    - contents:
      - '#!/bin/bash'
      - yara -w /usr/local/yara-rules/index.yar "${*}"
