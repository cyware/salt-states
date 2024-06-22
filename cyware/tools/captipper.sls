# Name: CapTipper
# Website: https://github.com/omriher/CapTipper/tree/python3_support
# Description: Analyze HTTP traffic and extract embedded artifacts.
# Category: Explore Network Interactions: Monitoring
# Author: Omri Herscovici: https://twitter.com/omriher
# License: GNU General Public License v3.0: https://github.com/omriher/CapTipper/blob/python3_support/LICENSE
# Notes: CapTipper.py

include:
  - cyware.packages.git
  - cyware.packages.python3

cyware-tools-captipper:
  git.latest:
    - name: https://github.com/omriher/CapTipper.git
    - rev: python3_support
    - target: /usr/local/CapTipper
    - force_reset: True
    - force_checkout: True
    - force_fetch: True
    - user: root
    - require:
      - sls: cyware.packages.python3

cyware-tools-captipper-permissions:
  file.managed:
    - name: /usr/local/CapTipper/CapTipper.py
    - mode: 755
    - watch:
      - git: cyware-tools-captipper

/usr/local/bin/CapTipper.py:
  file.symlink:
  - target: /usr/local/CapTipper/CapTipper.py
  - watch:
      - file: cyware-tools-captipper-permissions
