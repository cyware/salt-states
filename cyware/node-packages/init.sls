include:
  - cyware.node-packages.box-js
  - cyware.node-packages.jstillery

cyware-node-packages:
  test.nop:
    - require:
      - sls: cyware.node-packages.box-js
      - sls: cyware.node-packages.jstillery