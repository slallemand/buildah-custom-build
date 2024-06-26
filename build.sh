#!/bin/sh

set -x 

# Note that in this case the build inputs are part of the custom builder image, but normally this
# is retrieved from an external source.
# cd /tmp/input
# OUTPUT_REGISTRY and OUTPUT_IMAGE are env variables provided by the custom
# build framework
TAG="${OUTPUT_REGISTRY}/${OUTPUT_IMAGE}"

pwd
id
find /

# performs the build of the new image defined by dockerfile.sample
buildah --storage-driver vfs bud --isolation chroot -t ${TAG} .


# buildah requires a slight modification to the push secret provided by the service
# account to use it for pushing the image
# cp /var/run/secrets/openshift.io/push/.dockercfg /tmp
# (echo "{ \"auths\": " ; cat /var/run/secrets/openshift.io/push/.dockercfg ; echo "}") > /tmp/.dockercfg


# push the new image to the target for the build
# buildah --storage-driver vfs push --tls-verify=false --authfile /tmp/.dockercfg ${TAG}
# buildah --storage-driver vfs push --tls-verify=false --authfile /tmp/.dockercfg ${TAG}