# Name: 7-Zip
# Website: https://www.7-zip.org
# Description: Compress and decompress files using a variety of algorithms.
# Category: General Utilities, Examine Static Properties: General
# Author: Igor Pavlov
# License: GNU Lesser General Public License (LGPL)
# Notes: 7-Zip standard: 7z, 7za, 7zr. For latest alpha version, use 7zz instead of 7z.

include:
  - cyware.repos.cyware

cyware-packages-p7zip-full:
  pkg.installed:
    - name: p7zip-full

cyware-packages-7zz:
  pkg.installed:
    - name: 7zz
    - version: latest
    - upgrade: True
    - pkgrepo: cyware
