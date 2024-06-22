include:
  - cyware.scripts.pdf-parser
  - cyware.scripts.pdfid
  - cyware.scripts.rtfdump
  - cyware.python3-packages.xxxswf
  - cyware.python-packages.balbuzard
  - cyware.scripts.base64dump
  - cyware.node-packages.box-js
  - cyware.scripts.brxor
  - cyware.packages.clamav-daemon
  - cyware.packages.flare-floss
  - cyware.packages.spidermonkey
  - cyware.packages.oledump
  - cyware.python3-packages.oletools
  - cyware.python3-packages.peframe
  - cyware.python3-packages.thug
  - cyware.python-packages.volatility
  - cyware.packages.pev
  - cyware.rubygems.pedump
  - cyware.packages.swftools
  - cyware.packages.upx-ucl
  - cyware.python3-packages.xortool
  - cyware.scripts.virustotal-search
  - cyware.tools.cyware-cli
  - cyware.python3-packages.pcodedmp
  - cyware.scripts.xor-kpa
  - cyware.packages.msoffice-crypt
  - cyware.packages.binee
  - cyware.scripts.translate
  - cyware.scripts.zipdump
  - cyware.scripts.pecheck
  - cyware.python3-packages.unfurl
  - cyware.tools.capa

cyware-config-bash-completion-cywarelib:
  file.managed:
    - name: /etc/bash_completion.d/cywarelib
    - source: salt://cyware/config/bash-completion/cywarelib
    - replace: False
    - makedirs: True
    - mode: 644

cyware-config-bash-completion-pdf-parser:
  file.managed:
    - name: /etc/bash_completion.d/pdf-parser
    - source: salt://cyware/config/bash-completion/pdf-parser
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.scripts.pdf-parser

cyware-config-bash-completion-pdfid:
  file.managed:
    - name: /etc/bash_completion.d/pdfid
    - source: salt://cyware/config/bash-completion/pdfid
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.scripts.pdfid

cyware-config-bash-completion-rtfdump:
  file.managed:
    - name: /etc/bash_completion.d/rtfdump
    - source: salt://cyware/config/bash-completion/rtfdump
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.scripts.rtfdump

cyware-config-bash-completion-xxxswf:
  file.managed:
    - name: /etc/bash_completion.d/xxxswf
    - source: salt://cyware/config/bash-completion/xxxswf
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.python3-packages.xxxswf

cyware-config-bash-completion-balbuzard:
  file.managed:
    - name: /etc/bash_completion.d/balbuzard
    - source: salt://cyware/config/bash-completion/balbuzard
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.python-packages.balbuzard

cyware-config-bash-completion-base64dump:
  file.managed:
    - name: /etc/bash_completion.d/base64dump
    - source: salt://cyware/config/bash-completion/base64dump
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.scripts.base64dump

cyware-config-bash-completion-box-js:
  file.managed:
    - name: /etc/bash_completion.d/box-js
    - source: salt://cyware/config/bash-completion/box-js
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.node-packages.box-js

cyware-config-bash-completion-brxor:
  file.managed:
    - name: /etc/bash_completion.d/brxor
    - source: salt://cyware/config/bash-completion/brxor
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.scripts.brxor

cyware-config-bash-completion-clamav:
  file.managed:
    - name: /etc/bash_completion.d/clamav
    - source: salt://cyware/config/bash-completion/clamav
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.packages.clamav-daemon

cyware-config-bash-completion-floss:
  file.managed:
    - name: /etc/bash_completion.d/floss
    - source: salt://cyware/config/bash-completion/floss
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.packages.flare-floss

cyware-config-bash-completion-js:
  file.managed:
    - name: /etc/bash_completion.d/js
    - source: salt://cyware/config/bash-completion/js
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.packages.spidermonkey

cyware-config-bash-completion-oledump:
  file.managed:
    - name: /etc/bash_completion.d/oledump
    - source: salt://cyware/config/bash-completion/oledump
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.packages.oledump

cyware-config-bash-completion-zipdump:
  file.managed:
    - name: /etc/bash_completion.d/zipdump
    - source: salt://cyware/config/bash-completion/zipdump
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.scripts.zipdump

cyware-config-bash-completion-pecheck:
  file.managed:
    - name: /etc/bash_completion.d/pecheck
    - source: salt://cyware/config/bash-completion/pecheck
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.scripts.pecheck

cyware-config-bash-completion-olevba:
  file.managed:
    - name: /etc/bash_completion.d/olevba
    - source: salt://cyware/config/bash-completion/olevba
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.python3-packages.oletools

cyware-config-bash-completion-peframe:
  file.managed:
    - name: /etc/bash_completion.d/peframe
    - source: salt://cyware/config/bash-completion/peframe
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.python3-packages.peframe

cyware-config-bash-completion-thug:
  file.managed:
    - name: /etc/bash_completion.d/thug
    - source: salt://cyware/config/bash-completion/thug
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.python3-packages.thug

cyware-config-bash-completion-volatility:
  file.managed:
    - name: /etc/bash_completion.d/volatility
    - source: salt://cyware/config/bash-completion/volatility
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.python-packages.volatility

cyware-config-bash-completion-pev:
  file.managed:
    - name: /etc/bash_completion.d/pev
    - source: salt://cyware/config/bash-completion/pev
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.packages.pev

cyware-config-bash-completion-pedump:
  file.managed:
    - name: /etc/bash_completion.d/pedump
    - source: salt://cyware/config/bash-completion/pedump
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.rubygems.pedump

cyware-config-bash-completion-swfdump:
  file.managed:
    - name: /etc/bash_completion.d/swfdump
    - source: salt://cyware/config/bash-completion/swfdump
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.packages.swftools

cyware-config-bash-completion-upx:
  file.managed:
    - name: /etc/bash_completion.d/upx
    - source: salt://cyware/config/bash-completion/upx
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.packages.upx-ucl

cyware-config-bash-completion-xortool:
  file.managed:
    - name: /etc/bash_completion.d/xortool
    - source: salt://cyware/config/bash-completion/xortool
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.python3-packages.xortool

cyware-config-bash-completion-virustotal-search:
  file.managed:
    - name: /etc/bash_completion.d/virustotal-search
    - source: salt://cyware/config/bash-completion/virustotal-search
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.scripts.virustotal-search

cyware-config-bash-completion-cyware-cli:
  file.managed:
    - name: /etc/bash_completion.d/remnix-cli
    - source: salt://cyware/config/bash-completion/cyware-cli
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.tools.cyware-cli

cyware-config-bash-completion-pcodedmp:
  file.managed:
    - name: /etc/bash_completion.d/pcodedmp
    - source: salt://cyware/config/bash-completion/pcodedmp
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.python3-packages.pcodedmp

cyware-config-bash-completion-xor-kpa:
  file.managed:
    - name: /etc/bash_completion.d/xor-kpa
    - source: salt://cyware/config/bash-completion/xor-kpa
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.scripts.xor-kpa

cyware-config-bash-completion-msoffice-crypt:
  file.managed:
    - name: /etc/bash_completion.d/msoffice-crypt
    - source: salt://cyware/config/bash-completion/msoffice-crypt
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.packages.msoffice-crypt

cyware-config-bash-completion-binee:
  file.managed:
    - name: /etc/bash_completion.d/binee
    - source: salt://cyware/config/bash-completion/binee
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.packages.binee

cyware-config-bash-completion-translate:
  file.managed:
    - name: /etc/bash_completion.d/translate
    - source: salt://cyware/config/bash-completion/translate
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.scripts.translate

cyware-config-bash-completion-unfurl:
  file.managed:
    - name: /etc/bash_completion.d/unfurl
    - source: salt://cyware/config/bash-completion/unfurl
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.python3-packages.unfurl

cyware-config-bash-completion-capa:
  file.managed:
    - name: /etc/bash_completion.d/capa
    - source: salt://cyware/config/bash-completion/capa
    - replace: False
    - makedirs: True
    - mode: 644
    - require:
      - sls: cyware.tools.capa