include:
  - cyware.packages.perl
  - cyware.packages.build-essential

cyware-perl-packages-ole-storagelite-install:
  cmd.run:
    - name: cpan install OLE::Storage_Lite
    - env:
      - PERL_MM_USE_DEFAULT: 1
    - require:
      - sls: cyware.packages.perl
      - sls: cyware.packages.build-essential
