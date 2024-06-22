include:
#  - cyware.repos.saltstack
  - cyware.repos.docker
  - cyware.repos.draios
  - cyware.repos.inetsim
  - cyware.repos.openjdk
  - cyware.repos.gift
  - cyware.repos.sift
  - cyware.repos.mono
  - cyware.repos.cyware
  - cyware.repos.wireshark-dev
  - cyware.repos.microsoft
  - cyware.repos.microsoft-vscode
  - cyware.repos.nodejs
  - cyware.repos.gift

cyware-repos:
  test.nop:
    - require:
#      - sls: cyware.repos.saltstack
      - sls: cyware.repos.docker
      - sls: cyware.repos.draios
      - sls: cyware.repos.inetsim
      - sls: cyware.repos.openjdk
      - sls: cyware.repos.gift
      - sls: cyware.repos.sift
      - sls: cyware.repos.mono
      - sls: cyware.repos.cyware
      - sls: cyware.repos.wireshark-dev
      - sls: cyware.repos.microsoft
      - sls: cyware.repos.microsoft-vscode
      - sls: cyware.repos.nodejs
      - sls: cyware.repos.gift