# Name: peepdf-3
# Website: https://github.com/digitalsleuth/peepdf-3
# Description: Examine elements of the PDF file.
# Category: Analyze Documents: PDF
# Author: Jose Miguel Esparza and Corey Forman
# License: GNU General Public License (GPL) v3: https://github.com/digitalsleuth/peepdf-3/blob/main/COPYING
# Notes:

include:
  - cyware.packages.python3-pip
  - cyware.packages.libemu
  - cyware.packages.libjpeg8-dev
  - cyware.packages.zlib1g-dev
  - cyware.packages.git
  - cyware.python3-packages.stpyv8
  - cyware.python3-packages.pylibemu

cyware-tools-peepdf-3-source:
  pip.installed:
    - name: peepdf-3
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.packages.python3-pip
      - sls: cyware.packages.libemu
      - sls: cyware.packages.libjpeg8-dev
      - sls: cyware.packages.zlib1g-dev
      - sls: cyware.packages.git
      - sls: cyware.python3-packages.stpyv8
      - sls: cyware.python3-packages.pylibemu
