# Name: typing-extensions
# Website: https://github.com/python/typing_extensions
# Description: Typing Extensions and hints for Python
# Category: 
# Author: Python.org
# License: Python Software Foundation License v2 (https://github.com/python/typing_extensions/blob/main/LICENSE)
# Notes: 

include:
  - cyware.python3-packages.pip

typing-extensions>=4.5.0:
  pip.installed:
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
