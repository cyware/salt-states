include:
  - cyware.packages.iproute2

cyware-scripts-mynic-source:
  file.managed:
    - name: /usr/local/bin/mynic
    - source: https://raw.githubusercontent.com/cyware/distro/master/files/mynic
    - source_hash: sha256=7a6df684806e65a35d62c72542ccdf41e6c75b7456716e34f7d6b3771b580d36
    - makedirs: false
    - mode: 755
    - require:
      - sls: cyware.packages.iproute2