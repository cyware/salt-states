# Name: ExifTool
# Website: https://exiftool.org/
# Description: Tool to read from, write to, and edit EXIF metadata of various file types
# Category: Examine Static Properties: General
# Author: Phil Harvey
# License: "This is free software; you can redistribute it and/or modify it under the same terms as Perl itself": https://exiftool.org/#license
# Notes: exiftool

include:
  - cyware.packages.perl
  - cyware.packages.build-essential
  - cyware.packages.liblzma-dev
  - cyware.packages.libssl-dev
  - cyware.packages.zlib1g-dev
  - cyware.packages.unzip
  - cyware.perl-packages.net-ssleay

cyware-perl-packages-exiftool:
  cmd.run:
    - name: cpan install Image::ExifTool
    - env:
      - PERL_MM_USE_DEFAULT: 1
    - require:
      - sls: cyware.packages.perl
      - sls: cyware.packages.build-essential
      - sls: cyware.packages.liblzma-dev
      - sls: cyware.packages.libssl-dev
      - sls: cyware.packages.zlib1g-dev
      - sls: cyware.packages.unzip
      - sls: cyware.perl-packages.net-ssleay
