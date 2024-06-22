# Name: Viper
# Website: https://github.com/viper-framework/viper
# Description: Organize and query a collection of malware samples. (Temporarily excluded from the distro)
# Category: Gather and Analyze Data
# Author: Claudio Guarnieri: https://nex.sx
# License: BSD 3-Clause License: https://github.com/viper-framework/viper/blob/master/LICENSE
# Notes: Viper is temporarily excluded from the cyware distro due to dependency issues. Instead, use the cyware/viper Docker image: https://docs.cyware.org/run-tools-in-containers/cyware-containers#viper-binary-analysis-and-management-framework

{%- if grains['oscodename'] == "bionic" %}
  {%- set python3_version="python3.6" %}
{%- elif grains['oscodename'] == "focal" %}
  {%- set python3_version="python3.8" %}
{% endif %}
{%- set user = salt['pillar.get']('cyware_user', 'cyware') -%}

{%- if user == "root" -%}
  {%- set home = "/root" -%}
{%- else -%}
  {%- set home = "/home/" + user -%}
{% endif %}

include:
  - cyware.config.user
  - cyware.packages.libssl-dev
  - cyware.packages.swig
  - cyware.packages.libusb-1
  - cyware.packages.libfuzzy-dev
  - cyware.packages.git
  - cyware.packages.virtualenv
  - cyware.python3-packages.pip
  - cyware.packages.python3-virtualenv
  - cyware.packages.python3-venv
  - cyware.packages.build-essential
  - cyware.packages.libffi-dev
  - cyware.packages.unrar
  - cyware.packages.7zip
  - cyware.packages.tor
  - cyware.packages.clamav-daemon
  - cyware.packages.ssdeep
  - cyware.packages.libdpkg-perl
  - cyware.perl-packages.exiftool

cyware-python3-packages-viper-virtualenv:
  virtualenv.managed:
    - name: /opt/viper
    - venv_bin: /usr/bin/virtualenv
    - python: /usr/bin/python3
    - pip_pkgs:
      - pip
      - setuptools
      - wheel
    - require:
      - sls: cyware.python3-packages.pip
      - sls: cyware.packages.python3-virtualenv
      - sls: cyware.packages.python3-venv
      - sls: cyware.packages.virtualenv

cyware-python3-packages-viper-install:
  pip.installed:
    - name: viper-framework
    - bin_env: /opt/viper/bin/python3
    - require:
      - sls: cyware.packages.libssl-dev
      - sls: cyware.packages.swig
      - sls: cyware.packages.libusb-1
      - sls: cyware.packages.libfuzzy-dev
      - sls: cyware.packages.git
      - sls: cyware.python3-packages.pip
      - sls: cyware.packages.build-essential
      - sls: cyware.packages.libffi-dev
      - sls: cyware.packages.unrar
      - sls: cyware.packages.7zip
      - sls: cyware.packages.tor
      - sls: cyware.packages.clamav-daemon
      - sls: cyware.packages.ssdeep
      - sls: cyware.packages.libdpkg-perl
      - sls: cyware.perl-packages.exiftool
      - virtualenv: cyware-python3-packages-viper-virtualenv

cyware-python3-packages-viper-update-fix:
  file.replace:
    - name: /opt/viper/lib/{{ python3_version }}/site-packages/viper/core/ui/cmd/update-modules.py
    - pattern: '"pip3", "install"'
    - repl: '"/opt/viper/bin/pip3", "install"'
    - count: 1
    - prepend_if_not_found: False
    - require:
      - pip: cyware-python3-packages-viper-install

cyware-python3-packages-viper-directory:
  file.directory:
    - name: {{ home }}/.viper
    - makedirs: True
    - user: {{ user }}
    - group: {{ user }}
    - recurse:
      - user
      - group
    - require:
      - pip: cyware-python3-packages-viper-install
      - user: cyware-user-{{ user }}

cyware-python3-packages-viper-modules-git:
  git.latest:
    - name: https://github.com/viper-framework/viper-modules.git
    - target: {{ home }}/.viper/modules
    - user: {{ user }}
    - force_reset: True
    - force_checkout: True
    - force_fetch: True
    - require:
      - file: cyware-python3-packages-viper-directory

cyware-python3-packages-viper-modules-verify-sigs:
  file.replace:
    - name: {{ home }}/.viper/modules/requirements.txt
    - pattern: 'verify-sigs @ '
    - repl: ''
    - count: 1
    - prepend_if_not_found: False
    - require:
      - git: cyware-python3-packages-viper-modules-git

cyware-python3-packages-viper-modules-pymispgalaxies:
  file.replace:
    - name: {{ home }}/.viper/modules/requirements.txt
    - pattern: 'PyMISPGalaxies @ '
    - repl: ''
    - count: 1
    - prepend_if_not_found: False
    - require:
      - git: cyware-python3-packages-viper-modules-git

cyware-python3-packages-viper-modules-init:
  cmd.run:
    - name: git submodule init
    - cwd: {{ home }}/.viper/modules
    - require:
      - git: cyware-python3-packages-viper-modules-git

cyware-python3-packages-viper-modules-update:
  cmd.run:
    - name: git submodule update
    - cwd: {{ home }}/.viper/modules
    - require:
      - git: cyware-python3-packages-viper-modules-git

cyware-python3-packages-viper-modules-requirements:
  pip.installed:
    - requirements: {{ home }}/.viper/modules/requirements.txt
    - bin_env: /opt/viper/bin/pip3
    - require:
      - file: cyware-python3-packages-viper-modules-verify-sigs
      - file: cyware-python3-packages-viper-modules-pymispgalaxies

cyware-python3-packages-viper-symlink:
  file.symlink:
    - name: /usr/local/bin/viper
    - target: /opt/viper/bin/viper
    - force: true
    - require:
      - pip: cyware-python3-packages-viper-install

cyware-python3-packages-viper-venv-directory:
  file.directory:
    - name: /opt/viper
    - makedirs: False
    - user: {{ user }}
    - group: {{ user }}
    - recurse:
      - user
      - group
    - require:
      - pip: cyware-python3-packages-viper-install
