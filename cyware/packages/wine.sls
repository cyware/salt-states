# Name: Wine
# Website: https://www.winehq.org
# Description: Run Windows applications.
# Category: Dynamically Reverse-Engineer Code: General, General Utilities
# Author: https://wiki.winehq.org/Acknowledgements
# License: GNU Lesser General Public License (LGPL) v2.1 or later: https://wiki.winehq.org/Licensing
# Notes: wine

include:
  - cyware.packages.i386-architecture

cyware-packages-wine:
  pkg.installed:
    - name: wine-stable  
    - require:
      - sls: cyware.packages.i386-architecture