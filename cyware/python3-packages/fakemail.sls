# Name: fakemail
# Website: https://hg.sr.ht/~olly/fakemail
# Description: Intercept and examine SMTP email activity with this fake SMTP server.
# Category: Explore Network Interactions: Services
# Author: Oliver Cope
# License: Apache License 2.0: https://hg.sr.ht/~olly/fakemail/browse/LICENSE.txt?rev=default
# Notes: 

{%- if grains['oscodename'] == "focal" %}

include:
  - cyware.python3-packages.pip

cyware-python3-packages-fakemail:
  pip.installed:
    - name: fakemail
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip

{%- elif grains['oscodename'] == "bionic" %}

cyware-python3-packages-fakemail:
  test.nop

{%- endif %}
