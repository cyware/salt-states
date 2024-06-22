include:
  - cyware.packages.perl
  - cyware.packages.build-essential

cyware-perl-packages-crypt-rc4-install:
  cmd.run:
    - name: cpan install Crypt::RC4
    - env:
      - PERL_MM_USE_DEFAULT: 1
    - require:
      - sls: cyware.packages.perl
      - sls: cyware.packages.build-essential
