# Name: mail-parser
# Website: https://github.com/SpamScope/mail-parser
# Description: Parse raw SMTP and .MSG email messages and generate a parsed object from them.
# Category: Analyze Documents: Email Messages
# Author: Fedele Mantuano: https://twitter.com/fedelemantuano
# License: Apache License 2.0: https://github.com/SpamScope/mail-parser/blob/develop/LICENSE.txt
# Notes: Run the tool using command `mailparser`

include:
  - cyware.python3-packages.pip
  - cyware.packages.libemail-outlook-message-perl

cyware-python3-packages-mail-parser:
  pip.installed:
    - name: mail-parser
    - bin_env: /usr/bin/python3
    - upgrade: True
    - ignore_installed: True
    - require:
      - sls: cyware.python3-packages.pip
      - sls: cyware.packages.libemail-outlook-message-perl
