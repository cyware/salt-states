# Name: edb
# Website: https://github.com/eteran/edb-debugger
# Description: An AArch32/x86/x86-64 debugger, well suited for debugging ELF files.
# Category: Dynamically Reverse-Engineer Code: ELF Files
# Author: Evan Teran: http://codef00.com/about
# License: GNU General Public License (GPL) v2: https://github.com/eteran/edb-debugger/blob/master/COPYING
# Notes: 

include:
  - cyware.repos.cyware
  - cyware.packages.xterm
  
edb-debugger:
  pkg.installed:
    - pkgrepo: cyware
    - version: latest
    - upgrade: True
    - require:
      - sls: cyware.packages.xterm