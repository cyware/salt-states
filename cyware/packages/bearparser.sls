# Name: bearparser
# Website: https://github.com/hasherezade/bearparser/wiki
# Description: Parse PE file contents.
# Category: Examine Static Properties: PE Files
# Author: hasherezade: https://twitter.com/hasherezade
# License: BSD 2-Clause "Simplified" License: https://github.com/hasherezade/bearparser/blob/master/LICENSE
# Notes: bearcommander

include:
  - cyware.repos.cyware
  
bearparser:
  pkg.installed:
    - version: latest
    - upgrade: True
    - pkgrepo: cyware