# Name: Vivisect
# Website: https://github.com/vivisect/vivisect
# Description: Statically examine and emulate binary files.
# Category: Statically Analyze Code: General
# Author: invisigoth: invisigoth@kenshoto.com, installable vivisect module by Willi Ballenthin: https://twitter.com/williballenthin
# License: Apache License 2.0: https://github.com/vivisect/vivisect/blob/master/LICENSE.txt
# Notes: vivbin, vdbbin

include:
  - cyware.packages.python2-pip
  - cyware.python3-packages.pip

cyware-python3-packages-vivisect-pyqt:
  pip.installed:
    - name: PyQtWebEngine
    - bin_env: /usr/bin/python3
    - upgrade: True
    - ignore_installed: True
    - require:
      - sls: cyware.python3-packages.pip

cyware-python3-packages-vivisect-pyasn1-removal:
  pkg.removed:
    - pkgs:
      - python3-pyasn1
      - python3-pyasn1-modules

cyware-python3-packages-vivisect:
  pip.installed:
    - name: vivisect
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - pip: cyware-python3-packages-vivisect-pyqt
      - pkg: cyware-python3-packages-vivisect-pyasn1-removal

cyware-python3-packages-vivisect-cleanup:
  pip.removed:
    - bin_env: /usr/bin/python2
    - name: vivisect
    - require:
      - sls: cyware.packages.python2-pip
