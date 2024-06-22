include:
  - cyware.python3-packages.pip

cyware-python3-packages-pyperclip:
  pip.installed:
    - name: pyperclip
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
