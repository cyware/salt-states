include:
  - cyware.packages.perl
  - cyware.packages.build-essential

cyware-perl-packages-crypt-blowfish-install:
  cmd.run:
    - name: cpan install Crypt::Blowfish
    - env:
      - PERL_MM_USE_DEFAULT: 1
    - require:
      - sls: cyware.packages.perl
      - sls: cyware.packages.build-essential
