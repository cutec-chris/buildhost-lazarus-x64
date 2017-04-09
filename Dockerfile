FROM debian:latest
MAINTAINER Christian Ulrich

RUN apt-get -y update && \ 
    apt-get -y install fpc fpc-source binutils build-essential zip unzip wget libusb-dev libsane-dev sqlite3 postgresql-client binutils libgtk2.0-0 libgtk2.0-dev psmisc
RUN apt-get -y install git

RUN echo "Downloading and installing Debians" && \
    cd /tmp && \
    wget "https://downloads.sourceforge.net/project/lazarus/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.6.2/lazarus_1.6.2-0_amd64.deb?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Flazarus%2Ffiles%2FLazarus%2520Linux%2520amd64%2520DEB%2FLazarus%25201.4.4%2F&ts=1491691004&use_mirror=netix" -O lazarus.deb
RUN ls /tmp/* && \
    dpkg -i --force-depends /tmp/lazarus.deb

RUN wget -O /usr/local/bin/gitlab-ci-multi-runner https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-ci-multi-runner-linux-amd64 &&\
    chmod +x /usr/local/bin/gitlab-ci-multi-runner &&\
    useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

RUN apt-get clean && apt-get autoremove -y
VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]