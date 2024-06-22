# Name: Sysdig
# Website: https://github.com/draios/sysdig
# Description: Track and examine system activities on the local Linux system.
# Category: Investigate System Interactions
# Author: Sysdig Inc: https://sysdig.com
# License: Apache License 2.0: https://github.com/draios/sysdig/blob/dev/COPYING
# Notes: 

include:
  - cyware.repos.draios
  - cyware.packages.linux-headers

cyware-sysdig:
  pkg.installed:
    - name: sysdig
    - require:
      - pkgrepo: draios
      - sls: cyware.packages.linux-headers
