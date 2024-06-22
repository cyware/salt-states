include:
  - cyware.packages.perl
  - cyware.packages.build-essential
  - cyware.packages.libssl-dev

cyware-perl-packages-net-ssleay-install:
  cmd.run:
    - name: cpan install Net::SSLeay
    - env:
      - PERL_MM_USE_DEFAULT: 1
    - require:
      - sls: cyware.packages.perl
      - sls: cyware.packages.build-essential
      - sls: cyware.packages.libssl-dev
