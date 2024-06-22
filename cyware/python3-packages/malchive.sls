# Name: Malchive
# Website: https://github.com/MITRECND/malchive
# Description: Perform static analysis of various aspects of malicious code.
# Category: Statically Analyze Code: PE Files, Examine Static Properties: Deobfuscation
# Author: The MITRE Corporation, https://github.com/MITRECND/malchive/graphs/contributors
# License: Apache License 2.0: https://github.com/MITRECND/malchive/blob/main/LICENSE
# Notes: Malchive command-line tools start with the prefix `malutil-`. See [utilities documentation](https://github.com/MITRECND/malchive/wiki/Utilities) for details.

include:
  - cyware.python3-packages.pip
  - cyware.packages.git
  - cyware.packages.libsqlite3-dev
  - cyware.python3-packages.cffi

cyware-python3-packages-malchive:
  pip.installed:
    - bin_env: /usr/bin/python3
    - name: git+https://github.com/MITRECND/malchive.git
    - branch: main
    - require:
      - sls: cyware.python3-packages.pip
      - sls: cyware.packages.git
      - sls: cyware.packages.libsqlite3-dev
      - sls: cyware.python3-packages.cffi
