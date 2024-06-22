include:
  - cyware.packages.python2-pip
  - cyware.packages.libgraphviz-dev
  - cyware.packages.graphviz
  - cyware.packages.python3-pip

cyware-pygraphviz:
  pip.installed:
    - bin_env: /usr/bin/python2
    - name: pygraphviz
    - upgrade: True
    - install_options:
      - --include-path=/usr/include/graphviz
      - --library-path=/usr/lib/graphviz
    - require:
      - pkg: libgraphviz-dev
      - pkg: graphviz
      - sls: cyware.packages.python2-pip
