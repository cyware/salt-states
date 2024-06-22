include:
  - cyware.perl-packages.exiftool
  - cyware.perl-packages.archive-zip
  - cyware.perl-packages.crypt-rc4
  - cyware.perl-packages.crypt-blowfish
  - cyware.perl-packages.digest-crc
  - cyware.perl-packages.ole-storagelite
  - cyware.perl-packages.net-ssleay

cyware-perl-packages:
  test.nop:
    - require:
      - sls: cyware.perl-packages.exiftool
      - sls: cyware.perl-packages.archive-zip
      - sls: cyware.perl-packages.crypt-rc4
      - sls: cyware.perl-packages.crypt-blowfish
      - sls: cyware.perl-packages.digest-crc
      - sls: cyware.perl-packages.ole-storagelite
      - sls: cyware.perl-packages.net-ssleay
