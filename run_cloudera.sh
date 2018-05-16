#!/bin/sh

#backup area
#
#

docker run -d -i -t --privileged=true \
-p 11222:22 `# ssh` \
-p 18888:8888 `# Cloudera Hue` \
-p 17180:7180 `# Cloudera CM` \
-p 180:80 `# Cloudera Tutorials` \
-h cdh cdh:base /sbin/init

