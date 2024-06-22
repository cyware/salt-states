# Name: Network Miner Free Edition
# Website: https://www.netresec.com/
# Description: Examine network traffic and carve PCAP capture files.
# Category: Explore Network Interactions: Monitoring
# Author: NETRESEC AB
# License: GNU General Public License (GPL) v2: https://www.netresec.com/?page=NetworkMinerSourceCode
# Notes: networkminer

include:
  - cyware.packages.mono-devel

cyware-networkminer-source:
  file.managed:
    - name: /usr/local/src/cyware/files/networkminer-2.9.zip
    - source: https://download.netresec.com/networkminer/NetworkMiner_2-9.zip
    - source_hash: sha256=c610f6ba647ddd9c718e87018ee40595a4d72a52a6b3b7ceb53caf4fa8de6f05
    - makedirs: True
    - replace: False
    - require:
      - sls: cyware.packages.mono-devel

cyware-networkminer-archive:
  archive.extracted:
    - name: /usr/local/
    - source: /usr/local/src/cyware/files/networkminer-2.9.zip
    - enforce_toplevel: True
    - force: true
    - watch:
      - file: cyware-networkminer-source

/usr/local/NetworkMiner_2-9/NetworkMiner.exe:
  file.managed:
    - mode: 755
    - replace: False
    - watch:
      - archive: cyware-networkminer-archive

cyware-networkminer-wrapper:
  file.managed:
    - name: /usr/local/bin/networkminer
    - mode: 755
    - replace: True
    - watch:
        - file: /usr/local/NetworkMiner_2-9/NetworkMiner.exe
    - contents:
      - '#!/bin/bash'
      - mono /usr/local/NetworkMiner_2-9/NetworkMiner.exe "$@"

cyware-networkminer-cleanup:
  file.absent:
    - names: 
      - /usr/local/NetworkMiner_2-5
      - /usr/local/NetworkMiner_2-6
      - /usr/local/NetworkMiner_2-7-1
      - /usr/local/NetworkMiner_2-7-2
      - /usr/local/NetworkMiner_2-7-3
      - /usr/local/NetworkMiner_2-8-1
    - require:
      - file: cyware-networkminer-wrapper
