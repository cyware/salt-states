# Name: dnfile
# Website: https://github.com/malwarefrank/dnfile
# Description: Analyze static properties of .NET files.
# Category: Examine Static Properties: .NET
# Author: MalwareFrank
# License: MIT License: https://github.com/malwarefrank/dnfile/blob/master/LICENSE
# Notes: To use this library, create a Python program that imports it and loads the .NET file, as described in https://github.com/malwarefrank/dnfile/blob/master/README.rst.

include:
  - cyware.python3-packages.pip
  - cyware.python3-packages.pefile

cyware-python3-packages-dnfile:
  pip.installed:
    - name: dnfile
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
      - sls: cyware.python3-packages.pefile
