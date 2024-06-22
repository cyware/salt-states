{% set user = salt['pillar.get']('cyware_user', 'cyware') %}

include:
  - cyware.config.user
  - cyware.tools.networkminer

cyware-config-rename-networkminer-assembledfiles:
  file.rename:
    - name: /usr/local/NetworkMiner_2-9/AssembledFiles.original
    - source: /usr/local/NetworkMiner_2-9/AssembledFiles
    - force: true
    - makedirs: True
    - require:
      - sls: cyware.tools.networkminer
  
cyware-config-create-networkminer-assembledfiles:
  file.directory:
    - name: /var/log/networkminer/AssembledFiles/cache
    - makedirs: True
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - require:
      - user: cyware-user-{{ user }}
    - watch:
      - file: cyware-config-rename-networkminer-assembledfiles

cyware-config-networkminer-assembledfiles-link:
  file.symlink:
    - name: /usr/local/NetworkMiner_2-9/AssembledFiles
    - target: /var/log/networkminer/AssembledFiles
    - watch:
      - file: cyware-config-create-networkminer-assembledfiles

cyware-config-rename-networkminer-captures:
  file.rename:
    - name: /usr/local/NetworkMiner_2-9/Captures.original
    - source: /usr/local/NetworkMiner_2-9/Captures
    - force: true
    - makedirs: True
    - require:
      - sls: cyware.tools.networkminer
  
cyware-config-create-networkminer-captures:
  file.directory:
    - name: /var/log/networkminer/Captures
    - makedirs: True
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - require:
      - user: cyware-user-{{ user }}
    - watch:
      - file: cyware-config-rename-networkminer-captures

cyware-config-networkminer-captures-link:
  file.symlink:
    - name: /usr/local/NetworkMiner_2-9/Captures
    - target: /var/log/networkminer/Captures
    - watch:
      - file: cyware-config-create-networkminer-captures
