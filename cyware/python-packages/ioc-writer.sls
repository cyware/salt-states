# Name: ioc_writer
# Website: https://github.com/mandiant/ioc_writer
# Description: Python library that allows for basic creation and editing of OpenIOC objects.
# Category: Gather and Analyze Data
# Author: William Gibb
# License: Apache License 2.0: https://github.com/mandiant/ioc_writer/blob/master/LICENSE
# Notes: 

include:
  - cyware.packages.python2-pip
  - cyware.python-packages.lxml
  - cyware.packages.python3-pip

ioc_writer:
  pip.installed:
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.python2-pip
      - sls: cyware.python-packages.lxml
