# Name: nsrllookup
# Website: https://github.com/rjhansen/nsrllookup
# Description: Look up MD5 file hashes in the NIST National Software Reference Library (NSRL).
# Category: Gather and Analyze Data
# Author: Robert J. Hansen: https://twitter.com/robertjhansen
# License: ISC License: https://github.com/rjhansen/nsrllookup/blob/master/LICENSE
# Notes:

include:
  - cyware.repos.cyware
  
nsrllookup:
  pkg.installed:
    - version: latest
    - upgrade: True
    - pkgrepo: cyware