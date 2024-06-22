include:
  - cyware.packages.inetsim

cyware-config-inetsim:
  file.managed:
    - name: /etc/inetsim/inetsim.conf
    - source: salt://cyware/config/inetsim/inetsim.conf
    - user: root
    - group: root
    - makedirs: True
    - require:
      - sls: cyware.packages.inetsim

cyware-config-inetsim-permissions:
  file.managed:
    - name: /var/lib/inetsim/certs/default_key.pem
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.packages.inetsim

# Runlevel isn't in a Docker container, so check whether it exists before
# trying to control  services
{%- if salt['file.file_exists']('/sbin/runlevel') %}

cyware-config-inetsim-service:
  service.dead:
    - name: inetsim
    - enable: False
    - require:
      - sls: cyware.packages.inetsim

{% endif %}