# Name: radare2
# Website: https://www.radare.org/n/radare2.html
# Description: Examine binary files, including disassembling and debugging.
# Category: Dynamically Reverse-Engineer Code: General
# Author: https://github.com/radareorg/radare2/blob/master/AUTHORS.md
# License: GNU Lesser General Public License (LGPL) v3: https://github.com/radareorg/radare2/blob/master/COPYING
# Notes: r2, rasm2, rabin2, rahash2, rafind2

{% set version = '5.9.0' %}
{% set hash = '7164ab19c7c44dc47e3a3546b6a5335fa4e1713631afd8da916f921f9b7c0716' %}
{% set installed_version = salt['cmd.shell']("dpkg -l | grep radare2 | awk '{print $3}'") %}

include:
  - cyware.packages.git

{% if installed_version != '' and installed_version > version %}
Installed Version {{ installed_version }} is higher than intended version:
  test.nop
{% else %}

cyware-radare2-source:
  file.managed:
    - name: /usr/local/src/radare2_{{ version }}_amd64.deb
    - source: https://github.com/radareorg/radare2/releases/download/{{ version }}/radare2_{{ version }}_amd64.deb
    - source_hash: sha256={{ hash }}

cyware-radare2:
  pkg.installed:
    - sources:
      - radare2: /usr/local/src/radare2_{{ version }}_amd64.deb
    - watch:
      - file: cyware-radare2-source
    - require:
      - pkg: git

cyware-radare2-cleanup:
  pkg.removed:
    - name: libradare2-common
    - require:
      - pkg: cyware-radare2

cyware-radare2-init:
  cmd.wait:
    - name: r2pm init
    - watch:
      - pkg: cyware-radare2-cleanup

cyware-radare2-update:
  cmd.wait:
    - name: r2pm update
    - watch:
      - cmd: cyware-radare2-init

{% endif %}
