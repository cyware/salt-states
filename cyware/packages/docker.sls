# Name: Docker
# Website: https://www.docker.com
# Description: Run and manage containers.
# Category: General Utilities
# Author: Docker Inc.
# License: Apache License 2.0: https://github.com/moby/moby/blob/master/LICENSE
# Notes: 

include:
  - cyware.repos.docker
  - cyware.tools.docker-compose

docker-docker-engine:
  pkg.removed:
    - name: docker-engine

docker-docker-ce:
  pkg.installed:
    - name: docker-ce
    - require:
      - pkg: docker-docker-engine
      - sls: cyware.repos.docker
      - sls: cyware.tools.docker-compose
