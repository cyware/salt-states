# Name: dllcharacteristics.py
# Website: https://github.com/accidentalrebel/dllcharacteristics.py
# Description: Read and set DLL characteristics of a PE file.
# Category: Examine Static Properties: PE Files
# Author: Karlo Licudine: https://twitter.com/accidentalrebel
# License: GNU General Public License (GPL) v3.0: https://github.com/accidentalrebel/dllcharacteristics.py/blob/master/LICENSE
# Notes: 

include:
  - cyware.python3-packages.pefile
  - cyware.packages.python3

cyware-scripts-dllcharacteristics-source:
  file.managed:
    - name: /usr/local/bin/dllcharacteristics.py
    - source: https://raw.githubusercontent.com/accidentalrebel/dllcharacteristics.py/master/dllcharacteristics.py
    - source_hash: sha256=b0f8ebb322954f44c784bb70bf500a093b067d7a68022be8e77046e5d83bba09
    - makedirs: false
    - mode: 755
    - require:
      - sls: cyware.python3-packages.pefile
      - sls: cyware.packages.python3
