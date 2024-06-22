{% set user = salt['pillar.get']('cyware_user', 'cyware') %}

include:
  - cyware.config.user
  - cyware.packages.nginx

cyware-config-nginx-workers:
  file.replace:
    - name: /etc/nginx/nginx.conf
    - pattern: 'worker_processes auto;'
    - repl: 'worker_processes 1;'
    - prepend_if_not_found: False
    - count: 1
    - require:
      - sls: cyware.packages.nginx

cyware-config-nginx-sites-root:
  file.replace:
    - name: /etc/nginx/sites-enabled/default
    - pattern: '\tlocation / {\n\t\t# First attempt'
    - repl: '\tlocation / {\n\t\tautoindex on;\n\t\t# First attempt'
    - prepend_if_not_found: False
    - count: 1
    - backup: false
    - require:
      - sls: cyware.packages.nginx

cyware-config-nginx-default-index:
  file.absent:
    - name: /var/www/html/index.nginx-debian.html
    - require:
      - sls: cyware.packages.nginx

cyware-config-nginx-webroot-owner:
  file.directory:
    - name: /var/www/html
    - makedirs: True
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - require:
      - user: cyware-user-{{ user }}
    - require:
      - sls: cyware.packages.nginx