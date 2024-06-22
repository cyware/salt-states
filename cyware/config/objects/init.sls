# Name: objects.js
# Website: https://github.com/cyware/salt-states/blob/master/cyware/config/objects/objects.js
# Description: Emulate common browser and PDF viewer objects, methods, and properties when deobfuscating JavaScript.
# Category: Dynamically Reverse-Engineer Code: Scripts, 
# Author: Lenny Zeltser
# License: Public Domain
# Notes: The file is in /usr/local/share/cyware

cyware-config-objects:
  file.managed:
    - name: /usr/local/share/cyware/objects.js
    - source: salt://cyware/config/objects/objects.js
    - makedirs: True