FROM docbill/ubuntu-umake:14.04
MAINTAINER Bill C Riemers https://github.com/docbill

RUN ((echo "/opt/eclipse";echo "")|umake -v ide eclipse)

# Add the dockerfile to make rebuilds from the image easier
ADD Dockerfile /Dockerfile
ADD eclipse.sh /root/eclipse

RUN chmod 500 /root/eclipse

VOLUME /workspace
ENV HOME /workspace
WORKDIR /workspace

ENTRYPOINT ["/root/eclipse"]

