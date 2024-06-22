# Name: inspircd 3
# Website: https://www.inspircd.org/
# Description: Examine IRC activity with this IRC server.
# Category: Explore Network Interactions: Services
# Author: InspIRCd Development Team
# License: GNU General Public License (GPL) v2: https://docs.inspircd.org/license/
# Notes: 


{% set version = '3.15.0' %}
{%- if grains['oscodename'] == "focal" %}
  {% set os_rel = '20.04.3' %}
  {% set hash = '2d98e442c4a2a9a59bda10729eb8aac31444f5fedb58fcc65d23d415e03e7c2f' %}
{% elif grains['oscodename'] == "bionic" %}
  Ubuntu Bionic is no longer supported:
    test.nop
{% endif %}

include:
  - cyware.packages.libpq5
  - cyware.packages.libre2
  - cyware.packages.libtre5
  - cyware.packages.gnutls-bin

cyware-packages-inspircd-source:
  file.managed:
    - name: /usr/local/src/inspircd_{{ version }}.ubuntu{{ os_rel }}_amd64.deb
    - source: https://github.com/inspircd/inspircd/releases/download/v{{ version }}/inspircd_{{ version }}.ubuntu{{ os_rel }}_amd64.deb
    - source_hash: sha256={{ hash }}

cyware-packages-inspircd-install:
  pkg.installed:
    - sources:
      - inspircd: /usr/local/src/inspircd_{{ version }}.ubuntu{{ os_rel }}_amd64.deb
    - require:
      - sls: cyware.packages.libpq5
      - sls: cyware.packages.libre2
      - sls: cyware.packages.libtre5
      - sls: cyware.packages.gnutls-bin
    - watch:
      - file: cyware-packages-inspircd-source

# Runlevel isn't in a Docker container, so check whether it exists before
# trying to control services
{%- if salt['file.file_exists']('/sbin/runlevel') %}

inspircd-service:
  service.dead:
    - name: inspircd
    - enable: False
    - watch:
      - pkg: cyware-packages-inspircd-install

{% endif %}
