# Name: Origami
# Website: https://github.com/gdelugre/origami
# Description: Parse, modify, generate PDF files.
# Category: Analyze Documents: PDF
# Author: Guillaume Delugre
# License: GNU Lesser General Public License (LGPL) v3: https://github.com/gdelugre/origami/blob/master/COPYING.LESSER
# Notes: pdfcop, pdfdecompress, pdfdecrypt, pdfextract, etc.

include:
  - cyware.packages.ruby
  - cyware.rubygems.therubyracer

origami:
  gem.installed:
    - require:
      - pkg: ruby
      - sls: cyware.rubygems.therubyracer
