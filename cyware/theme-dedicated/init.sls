include:
  - cyware.packages.openssh

# Runlevel isn't in a Docker container, so check whether it exists before
# trying to control  services
{%- if salt['file.file_exists']('/sbin/runlevel') %}

cyware-theme-ssh-sshd-disable-service:
  service.dead:
    - name: ssh
    - enable: False
    - require:
      - sls: cyware.packages.openssh

{% endif %}