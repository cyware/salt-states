#!/bin/bash

docker run -it --rm --name="cyware-test-all" -v `pwd`/cyware:/srv/salt/cyware --cap-add SYS_ADMIN cyware/saltstack-tester:bionic:focal \
  salt-call -l info --local --retcode-passthrough --state-output=mixed state.sls cyware pillar='{"cyware_user": "root"}'
