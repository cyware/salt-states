# Name: Automater
# Website: http://www.tekdefense.com/automater/
# Description: Gather OSINT data about IPs, domains, and hashes.
# Category: Gather and Analyze Data
# Author: 1aN0rmus: https://twitter.com/TekDefense
# License: MIT License: https://github.com/1aN0rmus/TekDefense-Automater/blob/master/LICENSE
# Notes: Automater.py

include:
  - cyware.packages.git
  - cyware.python-packages.urllib3
  - cyware.python-packages.certifi

cyware-tools-automater:
  git.latest:
    - name: https://github.com/1aN0rmus/TekDefense-Automater
    - target: /usr/local/automater
    - user: root
    - branch: master
    - force_fetch: True
    - force_reset: True
    - force_checkout: True

cyware-tools-automater-binary:
  file.managed:
    - replace: False
    - name: /usr/local/automater/Automater.py
    - mode: 755
    - watch:
      - git: cyware-tools-automater
      - sls: cyware.python-packages.urllib3
      - sls: cyware.python-packages.certifi

cyware-tools-automater-symlink:
  file.symlink:
    - name: /usr/local/bin/Automater.py
    - target: /usr/local/automater/Automater.py
    - mode: 755

cyware-tools-automater-shebang:
  file.replace:
    - name: /usr/local/bin/Automater.py
    - pattern: '#!/usr/bin/python\n'
    - repl: '#!/usr/bin/env python2\n'
    - backup: False
    - count: 1
    - require:
      - file: cyware-tools-automater-binary
