{%- set user = salt['pillar.get']('cyware_user', 'cyware') -%}

include:
  - cyware.packages.docker

yelp:
  pkg.removed

avahi-daemon:
  pkg.removed

# Disable unattended updates and upgrades
unattended-upgrades:
  pkg.removed

cyware-theme-cleanup-disable-auto-upgrades:
  file.append:
    - name: /etc/apt/apt.conf.d/20auto-upgrades
    - text: "APT::Periodic::Update-Package-Lists \"0\";\nAPT::Periodic::Unattended-Upgrade \"0\";"
    - makedirs: True

# Runlevel isn't in a Docker container, so check whether it exists before
# trying to control  services
{%- if salt['file.file_exists']('/sbin/runlevel') %}

cyware-theme-cleanup-service-bluetooth:
  service.dead:
    - name: bluetooth
    - enable: False

cyware-theme-cleanup-service-docker:
  service.dead:
    - name: docker
    - enable: False
    - require:
      - sls: cyware.packages.docker

cyware-theme-cleanup-docker-wrapper:
  file.managed:
    - replace: False
    - user: root
    - group: root
    - mode: 755
    - name: /usr/local/bin/docker
    - source: salt://cyware/theme/cleanup/docker-wrapper.sh
    - makedirs: True
    - require:
      - sls: cyware.packages.docker

{% endif %}

cyware-theme-cleanup-autoremove:
  cmd.run:
    - name: apt-get autoremove -y