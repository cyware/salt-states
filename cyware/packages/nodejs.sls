include:
  - cyware.repos.nodejs

cyware-packages-nodejs:
  pkg.installed:
    - name: nodejs
    - version: latest
    - upgrade: True
    - pkgrepo: nodejs