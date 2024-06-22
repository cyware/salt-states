# Name: Anomy
# Website: https://github.com/izm1chael/Anomy
# Description: A wrapper around wget, ssh, sftp, ftp, and telnet to route these connections through Tor to anonymize your traffic.
# Category: Explore Network Interactions: Connecting
# Author: Mike Johnson: https://cyber-bytes.co.uk
# License: Free, unknown license
# Notes: anomy

include:
  - cyware.packages.tor
  - cyware.packages.sudo
  - cyware.packages.wget
  - cyware.packages.openssh

cyware-scripts-anomy-source:
  file.managed:
    - name: /usr/local/bin/anomy
    - source: https://github.com/izm1chael/Anomy/raw/main/anomy.sh
    - source_hash: sha256=2f2c3de8daff692878b2b351e33794179181ebd1faa3396aebfd1e79ec2c970d
    - makedirs: false
    - mode: 755
    - require:
      - sls: cyware.packages.tor
      - sls: cyware.packages.sudo
      - sls: cyware.packages.wget
      - sls: cyware.packages.openssh

cyware-scripts-anomy-user-agent:
  file.replace:
    - name: /usr/local/bin/anomy
    - pattern: '\-U "Mozilla\/4\.0 \(compatible; MSIE 8\.0; Windows NT 5\.1; Trident\/4\.0; GTB6; \.NET CLR 1\.1\.4322\)" '
    - repl: ''
    - backup: false
    - prepend_if_not_found: False
    - count: 1
    - require:
      - file: cyware-scripts-anomy-source