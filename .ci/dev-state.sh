#!/bin/bash

set -x

DISTRO=${DISTRO:="focal"}
STATE=$1

docker run -it --rm --name="cyware-state-${DISTRO}" -v `pwd`/cyware:/srv/salt/cyware --cap-add SYS_ADMIN cyware/saltstack-tester:${DISTRO} \
  /bin/bash
