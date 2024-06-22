# Name: oletools
# Website: http://www.decalage.info/python/oletools
# Description: Microsoft Office OLE2 compound documents.
# Category: Analyze Documents: Microsoft Office
# Author: Philippe Lagadec: https://twitter.com/decalage2
# License: Free, custom license: https://github.com/decalage2/oletools/blob/master/LICENSE.md
# Notes: mraptor, msodde, olebrowse, oledir, oleid, olemap, olemeta, oleobj, oletimes, olevba, pyxswf, rtfobj, ezhexviewer
{% if grains['oscodename'] == "focal" %}
  {% set python = "python3.8" %}
{% elif grains['oscodename'] == "bionic" %}
  {% set python = "python3.6" %}
{% endif %}

include:
  - cyware.python3-packages.pip
  - cyware.packages.python3-tk
  - cyware.packages.libssl-dev
  - cyware.packages.libffi-dev
  - cyware.python3-packages.xlmmacrodeobfuscator

cyware-python3-packages-oletools:
  pip.installed:
    - name: oletools
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cyware.python3-packages.pip
      - sls: cyware.packages.python3-tk
      - sls: cyware.packages.libssl-dev
      - sls: cyware.packages.libffi-dev
      - sls: cyware.python3-packages.xlmmacrodeobfuscator

cyware-python3-packages-oletools-cleanup:
  file.line:
    - name: /usr/local/lib/{{ python }}/dist-packages/oletools/olevba.py
    - mode: delete
    - content: "log.warning('For now, VBA stomping cannot be detected for files in memory')"
    - require:
      - pip: cyware-python3-packages-oletools
