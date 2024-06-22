# Name: PE Tree
# Website: https://github.com/blackberry/pe_tree
# Description: Examine contents and structure of PE files.
# Category: Examine Static Properties: PE Files
# Author: BlackBerry Limited: https://twitter.com/BlackBerrySpark and Tom Bonner: https://twitter.com/thomas_bonner
# License: Apache License 2.0: https://github.com/blackberry/pe_tree/blob/master/LICENSE
# Notes: pe-tree

include:
  - cyware.python3-packages.pip

cyware-python3-packages-pe-tree:
  pip.installed:
    - name: pe_tree
    - bin_env: /usr/bin/python3
    - upgrade: True
    - extra_args:
      - --only-binary
      - pyqt5
    - require:
      - sls: cyware.python3-packages.pip
