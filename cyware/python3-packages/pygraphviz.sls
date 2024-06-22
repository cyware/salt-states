include:
  - cyware.python3-packages.pip
  - cyware.packages.libgraphviz-dev
  - cyware.packages.graphviz

cyware-python3-packages-pygraphviz:
  pip.installed:
    - name: pygraphviz
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
      - sls: cyware.packages.graphviz
      - sls: cyware.packages.libgraphviz-dev
