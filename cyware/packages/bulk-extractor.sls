# Name: bulk_extractor
# Website: https://github.com/simsong/bulk_extractor/
# Description: Extract interesting strings from binary files.
# Category: Examine Static Properties: General, Perform Memory Forensics
# Author: https://github.com/simsong/bulk_extractor/blob/master/AUTHORS
# License: Portions Public Domain, portions MIT License: https://github.com/simsong/bulk_extractor/blob/master/LICENSE.md
# Notes: 

include:
  - cyware.repos.sift
  - cyware.repos.openjdk

bulk-extractor:
  pkg.installed:
    - version: latest
    - upgrade: True
    - require:
      - pkgrepo: sift-repo
      - pkgrepo: openjdk-repo