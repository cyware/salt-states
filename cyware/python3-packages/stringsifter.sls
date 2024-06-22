# Name: StringSifter
# Website: https://github.com/fireeye/stringsifter
# Description: Automatically rank strings based on their relevance to the analysis of suspicious Windows executables.
# Category: Examine Static Properties: PE Files
# Author: FireEye Inc.
# License: Apache License 2.0: https://github.com/fireeye/stringsifter/blob/master/LICENSE
# Notes: flarestrings

include:
  - cyware.python3-packages.pip

cyware-python3-packages-stringsifter:
  pip.installed:
    - name: stringsifter
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
