# Name: androguard
# Website: https://github.com/androguard/androguard
# Description: Examine Android files.
# Category: Statically Analyze Code: Android
# Author: Anthony Desnos, Geoffroy GueGuen
# License: Apache License 2.0: https://github.com/androguard/androguard/blob/master/LICENCE-2.0
# Notes: androarsc.py, androauto.py, androaxml.py, androcg.py, androdd.py, androdis.py, androguard, androgui.py, androlyze.py, androsign.py

include:
  - cyware.packages.python3-pyqt5
  - cyware.python3-packages.pip
  - cyware.python3-packages.pyperclip

cyware-python3-packages-androguard:
  pip.installed:
    - name: androguard
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.packages.python3-pyqt5
      - sls: cyware.python3-packages.pip
      - sls: cyware.python3-packages.pyperclip
