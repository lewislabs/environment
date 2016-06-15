FROM ubuntu:trusty
MAINTAINER chris.lewis@hudl.com
RUN mkdir /root/.aws
VOLUME /root/.aws
RUN sudo apt-get update
RUN sudo apt-get install -y python3-pip
RUN sudo pip3 install awscli
ENTRYPOINT ["aws"]

