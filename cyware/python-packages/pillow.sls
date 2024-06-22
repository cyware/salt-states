include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip

cyware-python-packages-pillow:
  pip.installed:
    - name: pillow
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.python2-pip
