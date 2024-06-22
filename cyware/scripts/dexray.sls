# Name: DeXRAY
# Website: http://www.hexacorn.com/blog/category/software-releases/dexray/
# Description: Extract and decode data from antivirus quarantine files.
# Category: Gather and Analyze Data
# Author: Hexacorn
# License: Free; copyright by Hexacorn.com: http://hexacorn.com/d/DeXRAY.pl
# Notes: dexray

include:
  - cyware.packages.perl
  - cyware.perl-packages.crypt-rc4
  - cyware.perl-packages.crypt-blowfish
  - cyware.perl-packages.archive-zip
  - cyware.perl-packages.digest-crc
  - cyware.perl-packages.ole-storagelite

cyware-scripts-dexray-source:
  file.managed:
    - name: /usr/local/bin/dexray
    - source: https://github.com/cyware/distro/raw/master/files/DeXRAY.pl
    - source_hash: sha256=fa3df2fe6619de3ddea869bff3940d15fb380c30bd1a76eb81b34779f964b3a6
    - mode: 755
    - requires:
      - sls: cyware.packages.perl
      - sls: cyware.perl-packages.crypt-rc4
      - sls: cyware.perl-packages.crypt-blowfish
      - sls: cyware.perl-packages.archive-zip
      - sls: cyware.perl-packages.digest-crc
      - sls: cyware.perl-packages.ole-storagelite
