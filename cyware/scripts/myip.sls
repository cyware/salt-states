# Name: myip
# Website: https://github.com/cyware/distro/blob/master/files/myip
# Description: Determine the IP address of the default network interface.
# Category: General Utilities
# Author: Lenny Zeltser, with input from the community
# License: Public Domain
# Notes: 

include:
  - cyware.packages.iproute2

cyware-scripts-myip-source:
  file.managed:
    - name: /usr/local/bin/myip
    - source: https://github.com/cyware/distro/raw/master/files/myip
    - source_hash: sha256=65c4392f1dc6ecef4759b5697300cd12e7a8cb470174e2b4dba55b9ded2c50c0
    - makedirs: false
    - mode: 755
    - require:
      - sls: cyware.packages.iproute2