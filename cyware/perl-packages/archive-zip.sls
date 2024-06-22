include:
  - cyware.packages.perl
  - cyware.packages.build-essential

cyware-perl-packages-archive-zip-install:
  cmd.run:
    - name: cpan install Archive::Zip
    - env:
      - PERL_MM_USE_DEFAULT: 1
    - require:
      - sls: cyware.packages.perl
      - sls: cyware.packages.build-essential
