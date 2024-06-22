#!/bin/bash

set -x

DISTRO=${DISTRO:="bionic"}
STATE=$1

docker run -it --rm --name="cyware-state-${STATE}" -v `pwd`/cyware:/srv/salt/cyware --cap-add SYS_ADMIN cyware/saltstack-tester:${DISTRO} \
  salt-call -l debug --local --retcode-passthrough --state-output=mixed state.sls ${STATE} pillar="{cyware_user: root}"
