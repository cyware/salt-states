# Install the cyware foundation. This is appropriate for adding cyware to an existing 
# system and doesn't modify the user's existing user interface or other aspects of 
# the environment that the user likely wants to keep intact.

include:
  - cyware.repos
  - cyware.packages
  - cyware.python-packages
  - cyware.python3-packages
  - cyware.rubygems
  - cyware.scripts
  - cyware.config
  - cyware.tools
  - cyware.node-packages
  - cyware.perl-packages
  - cyware.tools.cyware-cli

cyware-addon-version-file:
  file.managed:
    - name: /etc/cyware-version
    - source: salt://cyware/VERSION
    - user: root
    - group: root
    - require:
      - sls: cyware.repos
      - sls: cyware.packages
      - sls: cyware.python-packages
      - sls: cyware.python3-packages
      - sls: cyware.rubygems
      - sls: cyware.scripts
      - sls: cyware.config
      - sls: cyware.tools
      - sls: cyware.node-packages
      - sls: cyware.perl-packages
      - sls: cyware.tools.cyware-cli
