include:
  - cyware.packages.perl
  - cyware.packages.build-essential

cyware-perl-packages-digest-crc-install:
  cmd.run:
    - name: cpan install Digest::CRC
    - env:
      - PERL_MM_USE_DEFAULT: 1
    - require:
      - sls: cyware.packages.perl
      - sls: cyware.packages.build-essential
