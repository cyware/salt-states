include:
  - cyware.rubygems.origami
  - cyware.rubygems.pdnstool
  - cyware.rubygems.pedump

cyware-rubygems:
  test.nop:
    - require:
      - sls: cyware.rubygems.origami
      - sls: cyware.rubygems.pdnstool
      - sls: cyware.rubygems.pedump
