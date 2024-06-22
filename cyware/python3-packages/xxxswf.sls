# Name: xxxswf
# Website: https://github.com/viper-framework/xxxswf
# Description: Analyze Flash SWF files.
# Category: Statically Analyze Code: Flash
# Author: Alexander Hanel
# License: GNU General Public License (GPL) v3.0: https://github.com/viper-framework/xxxswf/blob/master/LICENSE.txt
# Notes: 

include:
  - cyware.packages.git
  - cyware.python3-packages.pip
  - cyware.python3-packages.yara-python3
  - cyware.python3-packages.pylzma

cyware-python3-packages-xxxswf:
  pip.installed:
    - name: git+https://github.com/viper-framework/xxxswf.git
    - bin_env: /usr/bin/python3
    - require:
      - sls: cyware.packages.git
      - sls: cyware.python3-packages.pip
      - sls: cyware.python3-packages.yara-python3
      - sls: cyware.python3-packages.pylzma
