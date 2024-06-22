# Name: pedump
# Website: https://github.com/zed-0xff/pedump
# Description: Statically analyze PE files and extract their components (e.g., resources).
# Category: Examine Static Properties: PE Files
# Author: Andrey "Zed" Zaikin
# License: MIT License: https://github.com/zed-0xff/pedump/blob/master/LICENSE.txt
# Notes: 

include:
  - cyware.packages.ruby

pedump:
  gem.installed:
    - require:
      - pkg: ruby
