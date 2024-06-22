# Name: FakeNet-NG
# Website: https://github.com/fireeye/flare-fakenet-ng
# Description: Emulate common network services and interact with malware.
# Category: Explore Network Interactions: Services
# Author: FireEye Inc, Peter Kacherginsky, Michael Bailey: https://github.com/fireeye/flare-fakenet-ng/blob/master/AUTHORS
# License: Apache License 2.0: https://github.com/fireeye/flare-fakenet-ng/blob/master/LICENSE.txt
# Notes: Run the tool using `sudo fakenet`. First, edit `/usr/lib/python2.7/dist-packages/fakenet/configs/default.ini`, changing the `LinuxRestrictInterface` parameter to your Ethernet network interface name, such as `ens33`.

include:
  - cyware.packages.python2-pip
  - cyware.packages.python3-pip
  - cyware.python-packages.cryptography
  - cyware.packages.build-essential
  - cyware.packages.libnetfilter-queue-dev
  - cyware.packages.libnfnetlink-dev
  - cyware.packages.git
{% if grains['oscodename'] == "bionic" %}
  - cyware.packages.python-dev
{% elif grains['oscodename'] == "focal" %}
  - cyware.packages.python2-dev
{% endif %}

cyware-python-packages-fakenet-requirements:
  pip.installed:
    - names:
      - pydivert
      - dnslib
      - dpkt
      - netfilterqueue
      - pyftpdlib
      - pyopenssl
    - bin_env: /usr/bin/python2
    - require:
      - sls: cyware.packages.python2-pip

fakenet-ng:
  pip.installed:
    - name: git+https://github.com/fireeye/flare-fakenet-ng.git
    - bin_env: /usr/bin/python2
    - require:
      - sls: cyware.packages.git
      - sls: cyware.packages.python2-pip
      - sls: cyware.python-packages.cryptography
      - sls: cyware.packages.build-essential
      - sls: cyware.packages.libnetfilter-queue-dev
      - sls: cyware.packages.libnfnetlink-dev
