# Name: debloat
# Website: https://github.com/Squiblydoo/debloat
# Description: Remove junk contents from bloated Windows executables.
# Category: Examine Static Properties: PE Files
# Author: Squiblydoo: https://twitter.com/SquiblydooBlog
# License: BSD 3-Clause License: https://github.com/Squiblydoo/debloat/blob/main/LICENSE
# Notes: Run the command-line version as `debloat` or the GUI version as `debloat-gui`

include:
  - cyware.python3-packages.pip

cyware-python3-packages-debloat:
  pip.installed:
    - name: debloat
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip