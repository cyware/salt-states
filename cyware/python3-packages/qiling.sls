# Name: Qiling
# Website: https://www.qiling.io
# Description: Emulate code execution of PE files, shellcode, etc. for a variety of OS and hardware platforms.
# Category: Statically Analyze Code: General, Dynamically Reverse-Engineer Code: Shellcode
# Author: https://github.com/qilingframework/qiling/blob/master/AUTHORS.TXT
# License: GNU General Public License (GPL) v2.0: https://github.com/qilingframework/qiling/blob/master/COPYING
# Notes: Use `qltool` to analyze artifacts. Before analyzing Windows artifacts, gather Windows DLLs and other components using the [dllscollector.bat](https://github.com/qilingframework/qiling/blob/master/examples/scripts/dllscollector.bat) script. Read the tool's [documentation](https://docs.qiling.io) to get started.

include:
  - cyware.packages.virtualenv
  - cyware.python3-packages.pip

cyware-python3-packages-remove-qiling:
  pip.removed:
    - name: qiling
    - bin_env: /usr/bin/python3

cyware-python3-packages-qiling-virtualenv:
  virtualenv.managed:
    - name: /opt/qiling
    - venv_bin: /usr/bin/virtualenv
    - python: /usr/bin/python3
    - pip_pkgs:
      - pip>=23.1.2
      - setuptools==67.7.2
      - wheel==0.38.4
      - pyyaml
      - six
    - require:
      - sls: cyware.packages.virtualenv
      - sls: cyware.packages.python3-pip
      - pip: cyware-python3-packages-remove-qiling

cyware-python3-packages-qiling:
  pip.installed:
    - name: qiling
    - bin_env: /opt/qiling/bin/python3
    - upgrade: True
    - require:
      - virtualenv: cyware-python3-packages-qiling-virtualenv

cyware-python3-packages-qiling-symlink:
  file.symlink:
    - name: /usr/local/bin/qltool
    - target: /opt/qiling/bin/qltool
    - makedirs: False
    - force: True
    - require:
      - pip: cyware-python3-packages-qiling
