# Install all aspects of cyware, include its customizations to the user experience.
# This is appropriate for systems dedicated to running cyware or to systems locally.

include:
    - cyware.addon
    - cyware.theme
    - cyware.theme-dedicated

cyware-dedicated:
  test.nop:
    - require:
      - sls: cyware.addon
      - sls: cyware.theme
      - sls: cyware.theme-dedicated