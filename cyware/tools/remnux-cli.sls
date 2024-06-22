# Name: cyware Installer
# Website: https://github.com/cyware/cyware-cli
# Description: Install and upgrade the cyware distro. 
# Category: General Utilities
# Author: Harbingers LLC, Erik Kristensen, revisions by Lenny Zeltser
# License: MIT License: https://github.com/cyware/cyware-cli/blob/master/LICENSE
# Notes: cyware

{%- set source = "https://github.com/cyware/cyware-cli/releases/download/v" -%}		
{% set hash = "88cd35b7807fc66ee8b51ee08d0d2518b2329c471b034ee3201e004c655be8d6" %}		
{% set version = "1.3.9" %}

cyware-tool-cyware-cli:
  file.managed:
    - name: /usr/local/bin/cyware
    - source: {{ source }}{{ version }}/cyware-cli-linux
    - source_hash: sha256={{ hash }}
    - mode: 755
