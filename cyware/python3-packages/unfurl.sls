# Name: Unfurl
# Website: https://github.com/obsidianforensics/unfurl
# Description: Deconstruct and decode data from a URL.
# Category: Explore Network Interactions: Connecting
# Author: Ryan Benson: https://twitter.com/_RyanBenson
# License: Apache License 2.0: https://github.com/obsidianforensics/unfurl/blob/master/LICENSE
# Notes: For the command-line version of the tool, run `unfurl_cli.py`. For the local browser-based version, run `unfurl_app.py`.

include:
  - cyware.python3-packages.protobuf
  - cyware.python3-packages.pip
  - cyware.packages.git

cyware-python3-packages-unfurl:
  pip.installed:
    - bin_env: /usr/bin/python3
    - name: dfir-unfurl
    - ignore_installed: True
    - require:
      - sls: cyware.python3-packages.pip
      - sls: cyware.packages.git
      - sls: cyware.python3-packages.protobuf
