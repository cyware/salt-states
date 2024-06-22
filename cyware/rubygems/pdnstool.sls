# Name: pdnstool
# Website: https://github.com/chrislee35/passivedns-client
# Description: Query passive DNS databases for DNS data.
# Category: Gather and Analyze Data
# Author: Chris Lee
# License: MIT License: https://github.com/chrislee35/passivedns-client/blob/master/LICENSE.txt
# Notes:

include:
  - cyware.packages.ruby
  - cyware.packages.ruby-dev
  - cyware.packages.build-essential
  - cyware.packages.libsqlite3-dev

sqlite3-gem:
  gem.installed:
    - name: sqlite3
    - version: 1.6.0
    - require:
      - pkg: ruby

passivedns-client:
  gem.installed:
    - require:
      - gem: sqlite3-gem
      - pkg: ruby-dev
      - pkg: build-essential
      - pkg: libsqlite3-dev
