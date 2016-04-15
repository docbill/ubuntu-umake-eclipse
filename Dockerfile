FROM ubuntu:14.04
MAINTAINER Bill C Riemers https://github.com/docbill

RUN apt-get update -y && \
	apt-get install -y software-properties-common python-software-properties && \
	add-apt-repository ppa:ubuntu-desktop/ubuntu-make && \
	apt-get update -y && \
	apt-get install -y ubuntu-make && \
	apt-get clean -y all

RUN ((echo "/opt/eclipse";echo "")|umake -v ide eclipse)

ADD Dockerfile /Dockerfile
ADD eclipse.sh /root/eclipse

RUN chmod 500 /root/eclipse

VOLUME /workspace
ENV HOME /workspace
WORKDIR /workspace

ENTRYPOINT ["/root/eclipse"]

