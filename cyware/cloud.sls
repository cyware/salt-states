# Install all aspects of cyware, include its customizations to the user experience.
# This is appropriate for systems dedicated to running cyware or to systems in a cloud.

include:
    - cyware.addon
    - cyware.theme

cyware-cloud:
  test.nop:
    - require:
      - sls: cyware.addon
      - sls: cyware.theme