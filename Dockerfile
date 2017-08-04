FROM docbill/ubuntu-umake:14.04
MAINTAINER Bill C Riemers https://github.com/docbill

RUN ((echo "/opt/eclipse";echo "")|umake -v ide eclipse)

# Add the dockerfile to make rebuilds from the image easier
ADD Dockerfile /Dockerfile
ADD eclipse-wrapper /usr/bin/eclipse-wrapper

RUN chmod 555 /usr/bin/eclipse-wrapper
RUN sed -i -e "s/-Xmx[0-9]m/-Xmx4096m/" /etc/eclipse/eclipse.ini

VOLUME /workspace
WORKDIR /workspace

ENTRYPOINT ["/usr/bin/eclipse-wrapper"]

