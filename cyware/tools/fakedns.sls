# Name: fakedns
# Website: https://github.com/SocialExploits/fakedns/blob/main/fakedns.py
# Description: Respond to DNS queries with the specified IP address.
# Category: Explore Network Interactions: Services
# Author: Mike Murr: mike@socialexploits.com, https://socialexploits.com
# License: Apache License 2.0
# Notes: Use the `-h` parameter to display usage and help details.

include:
  - cyware.packages.python3
  - cyware.packages.python3-netifaces

cyware-tools-fakedns-source:
  file.managed:
    - name: /usr/local/src/cyware/files/fakedns.py
    - source: https://github.com/SocialExploits/fakedns/raw/main/fakedns.py
    - source_hash: 6c0f814c15f2e5ec1d3e11a341b3bd53bf2b9c464ceaa5fd88d3d3cdca3d1ff2
    - makedirs: True
    - require:
        - sls: cyware.packages.python3
        - sls: cyware.packages.python3-netifaces

cyware-tools-fakedns-binary:
  file.managed:
    - name: /usr/local/bin/fakedns
    - source: /usr/local/src/cyware/files/fakedns.py
    - mode: 755
    - watch:
        - file: cyware-tools-fakedns-source