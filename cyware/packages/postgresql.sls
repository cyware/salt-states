# Name: PostgreSQL
# Website: https://www.postgresql.org
# Description: Relational Database
# Category: General Utilities
# Author: PostgreSQL Global Development Group
# License: PostgreSQL Licence: https://www.postgresql.org/about/licence/
# Notes: 

include:
  - cyware.packages.pgadmin3

postgresql:
  pkg.installed:
    - require:
      - sls: cyware.packages.pgadmin3

# Runlevel isn't in a Docker container, so check whether it exists before
# trying to control  services
{%- if salt['file.file_exists']('/sbin/runlevel') %}

postgresql-service:
  service.dead:
    - name: postgresql
    - enable: False
    - watch:
      - pkg: postgresql

{% endif %}