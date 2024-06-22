# Name: Magika
# Website: https://google.github.io/magika
# Description: Identify file type using signatures.
# Category: Examine Static Properties: General
# Author: Google
# License: Apache License 2.0 (https://github.com/google/magika/blob/main/LICENSE)
# Notes:

include:
  - cyware.packages.python3-pip
  - cyware.packages.virtualenv

cyware-python3-packages-magika-venv:
  virtualenv.managed:
    - name: /opt/magika
    - python: /usr/bin/python3
    - pip_pkgs:
      - pip>=23.1.2
      - setuptools==67.7.2
      - wheel==0.38.4
    - require:
      - sls: cyware.packages.virtualenv
      - sls: cyware.packages.python3-pip

cyware-python3-packages-magika-install:
  pip.installed:
    - name: magika
    - bin_env: /opt/magika/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.packages.python3-pip
      - virtualenv: cyware-python3-packages-magika-venv

cyware-python3-packages-magika-symlink:
  file.symlink:
    - name: /usr/local/bin/magika
    - target: /opt/magika/bin/magika
    - makedirs: False
    - require:
      - pip: cyware-python3-packages-magika-install
