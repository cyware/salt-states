# Name: Volatility 3
# Website: https://github.com/volatilityfoundation/volatility3
# Description: Memory forensics tool and framework
# Category: Perform Memory Forensics
# Author: The Volatility Foundation
# License: Volatility Software License: https://github.com/volatilityfoundation/volatility3/blob/master/LICENSE.txt
# Notes: Invoke using: vol3, volshell3. Before using, download symbols by following the links from https://github.com/volatilityfoundation/volatility3#symbol-tables and place them in `/usr/local/lib/python3.8/dist-packages/volatility3/framework/symbols`

include:
  - cyware.packages.git
  - cyware.python3-packages.pip

cyware-python3-packages-volatility3-requirements:
  pip.installed:
    - requirements: https://raw.githubusercontent.com/volatilityfoundation/volatility3/develop/requirements.txt
    - bin_env: /usr/bin/python3

cyware-python3-packages-volatility3:
  pip.installed:
    - name: volatility3
    - bin_env: /usr/bin/python3
    - require:
      - sls: cyware.packages.git
      - sls: cyware.python3-packages.pip

cyware-python3-packages-volatility-rename-vol:
  file.rename:
    - name: /usr/local/bin/vol3
    - source: /usr/local/bin/vol
    - force: true
    - makedirs: True
    - watch:
      - pip: cyware-python3-packages-volatility3

cyware-python3-packages-volatility-rename-volshell:
  file.rename:
    - name: /usr/local/bin/volshell3
    - source: /usr/local/bin/volshell
    - force: true
    - makedirs: True
    - watch:
      - pip: cyware-python3-packages-volatility3
