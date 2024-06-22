{%- set remove_plugins = ["malprocfind.py","idxparser.py","chromehistory.py","mimikatz.py","openioc_scan.py","pstotal.py","firefoxhistory.py","autoruns.py","malfinddeep.py","prefetch.py","ssdeepscan.py","uninstallinfo.py","trustrecords.py","usnparser.py","apihooksdeep.py","editbox.py","javarat.py"] -%}

# Name: Volatility Framework
# Website: https://github.com/volatilityfoundation/volatility
# Description: Memory forensics tool and framework
# Category: Perform Memory Forensics
# Author: https://github.com/volatilityfoundation/volatility/blob/2.6.1/AUTHORS.txt
# License: GNU General Public License (GPL) v2: https://github.com/volatilityfoundation/volatility/blob/2.6.1/LICENSE.txt
# Notes: Use vol.py to invoke this version of Volatility. To eliminate conflicts among command-line options for Volatility plugins, the following `yarascan` options have been changed: `-Y` became `-U` and `-C` became `-c`.

include:
  - cyware.packages.git
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip
  - cyware.python-packages.colorama
  - cyware.python-packages.construct
  - cyware.python-packages.dpapick
  - cyware.python-packages.distorm3
  - cyware.python-packages.ioc-writer
  - cyware.python-packages.lxml
  - cyware.python-packages.openpyxl
  - cyware.python-packages.pefile
  - cyware.python-packages.pillow
  - cyware.python-packages.pycoin
  - cyware.python-packages.pycrypto
  - cyware.python-packages.pysocks
  - cyware.python-packages.requests
  - cyware.python-packages.simplejson
  - cyware.python-packages.yara-python

# openpyxl is needed for the timeliner plugin
cyware-python-packages-volatility:
  pip.installed:
    - name: git+https://github.com/volatilityfoundation/volatility.git
    - branch: master
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: cyware.packages.git
      - sls: cyware.packages.python2-pip

/usr/bin/vol.py:
  file.symlink:
    - target: /usr/bin/volatility
    - watch:
      - pip: cyware-python-packages-volatility

cyware-python-packages-volatility-community-plugins:
  git.latest:
    - name: https://github.com/sans-dfir/volatility-plugins-community.git
    - target: /usr/local/lib/python2.7/dist-packages/volatility/plugins/community
    - user: root
    - branch: master
    - force_fetch: True
    - force_checkout: True
    - force_clone: True
    - force_reset: True
    - require:
      - pip: cyware-python-packages-volatility
      - sls: cyware.packages.git
      - sls: cyware.python-packages.colorama
      - sls: cyware.python-packages.construct
      - sls: cyware.python-packages.dpapick
      - sls: cyware.python-packages.distorm3
      - sls: cyware.python-packages.ioc-writer
      - sls: cyware.python-packages.lxml
      - sls: cyware.python-packages.openpyxl
      - sls: cyware.python-packages.pefile
      - sls: cyware.python-packages.pillow
      - sls: cyware.python-packages.pycoin
      - sls: cyware.python-packages.pycrypto
      - sls: cyware.python-packages.pysocks
      - sls: cyware.python-packages.requests
      - sls: cyware.python-packages.simplejson
      - sls: cyware.python-packages.yara-python

cyware-python-packages-volatility-malfind-yarascan-options1:
  file.replace:
    - name: /usr/local/lib/python2.7/dist-packages/volatility/plugins/malware/malfind.py
    - pattern: short_option = 'C'
    - repl: short_option = 'c'
    - prepend_if_not_found: False
    - count: 1
    - require:
      - git: cyware-python-packages-volatility-community-plugins

cyware-python-packages-volatility-malfind-yarascan-options2:
  file.replace:
    - name: /usr/local/lib/python2.7/dist-packages/volatility/plugins/malware/malfind.py
    - pattern: short_option = 'Y'
    - repl: short_option = 'U'
    - prepend_if_not_found: False
    - count: 1
    - require:
      - file: cyware-python-packages-volatility-malfind-yarascan-options1

{% for plugin in remove_plugins -%}

cyware-python-packages-volatility-plugins-{{ plugin }}-absent:
  file.absent:
    - name: /usr/local/lib/python2.7/dist-packages/volatility/plugins/{{ plugin }}
    - watch:
      - git: cyware-python-packages-volatility-community-plugins
      - pip: cyware-python-packages-volatility

{% endfor -%}

cyware-python-packages-volatility-mimikatz-plugin-update:
  file.managed:
    - name: /usr/local/lib/python2.7/dist-packages/volatility/plugins/community/FrancescoPicasso/mimikatz.py
    - source: https://github.com/RealityNet/hotoloti/raw/master/volatility/mimikatz.py
    - source_hash: sha256=75e2e6d3b09daffad83211ba0215ed3f204623b8c37c2a2950665b88a3d2ce86
    - mode: 644
    - watch:
      - git: cyware-python-packages-volatility-community-plugins
      - pip: cyware-python-packages-volatility

cyware-python-packages-volatility-pstotal:
  file.managed:
    - name: /usr/local/lib/python2.7/dist-packages/volatility/plugins/sift/pstotal.py
    - source: https://github.com/teamdfir/sift-saltstack/raw/master/sift/files/volatility/pstotal.py
    - source_hash: sha256=aaa88ce1fe88576f471e2ce40ea21c3e988bba642853df3000776c06320c0582
    - mode: 644
    - makedirs: True
    - watch:
      - pip: cyware-python-packages-volatility

cyware-python-packages-volatility-pstotal-init:
  file.managed:
    - name: /usr/local/lib/python2.7/dist-packages/volatility/plugins/sift/__init__.py
    - mode: 644
    - replace: False
    - watch:
      - file: cyware-python-packages-volatility-pstotal

cyware-python-packages-volatility-chromehistory-plugin-update:
  file.managed:
    - name: /usr/local/lib/python2.7/dist-packages/volatility/plugins/community/DaveLasalle/chromehistory.py
    - source: https://github.com/superponible/volatility-plugins/raw/master/chromehistory.py
    - source_hash: sha256=6d4f76ae380f7b581fb2a3d2c1620623461d5c0975a21c76d2f40948f7f68b4a
    - mode: 644
    - replace: True
    - watch:
      - git: cyware-python-packages-volatility-community-plugins
      - pip: cyware-python-packages-volatility
