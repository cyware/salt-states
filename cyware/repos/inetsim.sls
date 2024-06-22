cyware-inetsim-key:
  file.managed:
    - name: /usr/share/keyrings/INETSIM-GPG-KEY.asc
    - source: salt://cyware/repos/files/INETSIM-GPG-KEY.asc
    - skip_verify: True
    - makedirs: True

inetsim-repo:
  pkgrepo.managed:
    - humanname: InetSim
    - name: deb [signed-by=/usr/share/keyrings/INETSIM-GPG-KEY.asc] http://www.inetsim.org/debian/ binary/
    - file: /etc/apt/sources.list.d/inetsim.list
    - refresh: True
    - clean_file: True
    - require:
      - file: cyware-inetsim-key
