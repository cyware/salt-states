# Name: peepdf
# Website: https://eternal-todo.com/tools/peepdf-pdf-analysis-tool
# Description: Examine elements of the PDF file.
# Category: Analyze Documents: PDF
# Author: Jose Miguel Esparza
# License: GNU General Public License (GPL) v3: https://github.com/jesparza/peepdf/blob/master/COPYING
# Notes: This state removes the python2 version of peepdf

include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip

cyware-tools-peepdf-remove:
  pip.removed:
    - name: peepdf
    - bin_env: /usr/bin/python2
    - require:
      - sls: cyware.packages.python2-pip
