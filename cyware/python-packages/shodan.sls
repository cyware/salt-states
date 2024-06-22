# Name: shodan
# Website: https://github.com/achillean/shodan-python/
# Description: Query Shodan, a search engine for internet-connected devices.
# Category: Gather and Analyze Data
# Author: John Matherly
# License: Custom, free license: https://github.com/achillean/shodan-python/blob/master/LICENSE
# Notes: 

include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip

shodan:
  pip.installed:
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.python2-pip
