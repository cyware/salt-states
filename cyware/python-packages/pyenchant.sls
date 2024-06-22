include:
  - cyware.packages.python3-pip
  - cyware.packages.python2-pip
  - cyware.packages.enchant

cyware-python-packages-pyenchant:
  pip.installed:
    - name: pyenchant
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.enchant
      - sls: cyware.packages.python2-pip
