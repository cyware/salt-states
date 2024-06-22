# Runlevel isn't in a Docker container, so check whether it exists before
# trying to control  services
{%- if salt['file.file_exists']('/sbin/runlevel') %}

cyware-config-salt-minion:
  service.dead:
    - name: salt-minion
    - enable: False

{% endif %}

cyware-config-salt-minion-placeholder:
  test.nop