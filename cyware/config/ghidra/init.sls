{%- set user = salt['pillar.get']('cyware_user', 'cyware') -%}

{%- if user == "root" -%}
  {%- set home = "/root" -%}
{%- else %}
  {%- set home = "/home/" + user -%}
{%- endif -%}

include:
  - cyware.config.user
  - cyware.packages.ghidra

cyware-config-ghidra-gdt-file:
  file.managed:
    - name: /usr/local/src/cyware/files/ghidra-data-type.zip
    - source: https://raw.githubusercontent.com/cyware/distro/master/files/ghidra-data-type.zip
    - source_hash: sha256=40d0d4595b8f0e6854d276a72cd0a9ce03f112a5512b28def5aefa8bbd795657
    - makedirs: true
    - require:
      - sls: cyware.packages.ghidra

cyware-config-ghidra-gdt-archive:
  archive.extracted:
    - name: {{ home }}/.ghidra/gdt
    - source: /usr/local/src/cyware/files/ghidra-data-type.zip
    - user: {{ user }}
    - group: {{ user }}
    - enforce_toplevel: False
    - require:
      - user: cyware-user-{{ user }}
    - watch:
      - file: cyware-config-ghidra-gdt-file

cyware-config-ghidra-file-preferences:
  file.managed:
    - name: {{ home }}/.ghidra/.ghidra_10.1.1_PUBLIC/preferences 
    - source: salt://cyware/config/ghidra/preferences
    - replace: False
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: True
    - require:
      - user: cyware-user-{{ user }}
    - watch:
      - archive: cyware-config-ghidra-gdt-archive

cyware-config-ghidra-file-tool-code-browser:
  file.managed:
    - name: {{ home }}/.ghidra/.ghidra_10.1.1_PUBLIC/tools/_code_browser.tcd
    - source: salt://cyware/config/ghidra/tool-code-browser.tcd
    - replace: False
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: True
    - require:
      - user: cyware-user-{{ user }}
    - watch:
      - sls: cyware.packages.ghidra

cyware-config-ghidra-file-tool-version-tracking:
  file.managed:
    - name: {{ home }}/.ghidra/.ghidra_10.1.1_PUBLIC/tools/_version _tracking.tcd
    - source: salt://cyware/config/ghidra/tool-version-tracking.tcd
    - replace: False
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: True
    - require:
      - user: cyware-user-{{ user }}
    - watch:
      - sls: cyware.packages.ghidra

cyware-config-ghidra-owner:
   file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - name: {{ home }}/.ghidra
    - makedirs: True
    - recurse:
      - user
      - group
    - watch:
      - sls: cyware.packages.ghidra