# Name: libemu
# Website: https://github.com/buffer/libemu
# Description: A library for x86 code emulation and shellcode detection
# Category: Dynamically Reverse-Engineer Code: Shellcode
# Author: https://github.com/buffer/libemu/blob/master/AUTHORS
# License: Free, unknown license
# Notes: 

include:
  - cyware.repos.cyware
  
libemu:
  pkg.installed:
    - pkgrepo: cyware

libemu-dev:
  pkg.installed:
    - pkgrepo: cyware

cyware-packages-libemu-ldconfig:
  cmd.run:
    - name: ldconfig
    - watch:
      - pkg: libemu
