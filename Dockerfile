FROM gitlab/gitlab-runner:alpine

MAINTAINER Christian Ulrich

RUN apt-get update
RUN apt-get install -y lazarus libusb-dev libsane-dev