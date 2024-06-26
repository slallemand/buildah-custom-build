FROM registry.redhat.io/rhel8/buildah
# In this example, `/tmp/build` contains the inputs that build when this
# custom builder image is run. Normally the custom builder image fetches
# this content from some location at build time, by using git clone as an example.
ADD build.sh /usr/local/bin
#RUN id && ls -l /usr/local/bin/build.sh && chmod +x /usr/local/bin/build.sh
# /usr/bin/build.sh contains the actual custom build logic that will be run when
# this custom builder image is run.
WORKDIR /builds
RUN chmod g+w /builds

ENTRYPOINT ["/usr/local/bin/build.sh"]