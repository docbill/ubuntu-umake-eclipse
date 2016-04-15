# docker-force
A docker container to eclipse in ubuntu with the specified workspace.

## Overview

Although there are many eclipse images available, most are very vague about
what the contain.  This container is designed primarily to run the 
Force.com IDE, but is appropriate for many other uses.  Your workspace should
be provided as a volume.  To keep things simple the eclipse will run as the
owner of that volume, and the workspace will also be used as the home directory.
That way there is no need to persist data inside the container.

 
## Quick Start

 
If you have already have docker working you can start eclipse as easily as:

	[ -d ~/workspace ] || mkdir ~/workspace
	xhost local:root
	sudo docker run -i --net=host --rm -e DISPLAY -v $HOME/workspace/:/workspace/ docbill ubuntu-umake-eclipse


The first time you run this command it will download the image.
 

If you wish to install the Force.com IDE, follow the instructions at:

	Force.com IDE Installation - developer.force.com
	https://developer.salesforce.com/page/Force.com_IDE

If you do not have docker installed read on.

 
## Installing Docker On Fedora, CentOS and RHEL

 

To install docker on Fedora and RHEL7, the following commands should work:

 

	sudo dnf install docker
	sudo systemctl start docker
	sudo systemctl enable docker

For older version of Fedora and RHEL6 the commands are:

	sudo yum install docker-io
	sudo service docker start
	sudo chkconfig docker on


One of the things you might want to do is to set storage options to something
other than loopback, as I find disk full errors can corrupt all your docker
images when using loopback.

