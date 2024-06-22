cyware-repo-key:
  file.managed:
    - name: /usr/share/keyrings/CYWARE-GPG-KEY.asc
    - source: salt://cyware/repos/files/CYWARE-GPG-KEY.asc
    - skip_verify: True
    - makedirs: True

cyware-repo:
  pkgrepo.managed:
    - name: deb [signed-by=/usr/share/keyrings/CYWARE-GPG-KEY.asc] https://ppa.launchpadcontent.net/cyware/stable/ubuntu {{ grains['lsb_distrib_codename'] }} main
    - file: /etc/apt/sources.list.d/cyware-stable-{{ grains['lsb_distrib_codename'] }}.list
    - refresh: True
    - clean_file: True
    - require:
      - file: cyware-repo-key
