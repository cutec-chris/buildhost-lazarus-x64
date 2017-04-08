FROM debian:latest
MAINTAINER Christian Ulrich

RUN apt-get -y update && \ 
    apt-get -y install fpc binutils build-essential zip unzip wget libusb-dev libsane-dev sqlite3 postgresql-client binutils libgtk2.0-0 libgtk2.0-dev psmisc

RUN echo "Downloading and installing Debians" && \
    cd /tmp && \
    wget "https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.6.4/lazarus-project_1.6.4-0_amd64.deb/download" -o lazarus.deb
RUN ls /tmp/* && \
    dpkg -i /tmp/lazarus.deb

RUN wget -O /usr/local/bin/gitlab-ci-multi-runner https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-ci-multi-runner-linux-amd64 &&\
    chmod +x /usr/local/bin/gitlab-ci-multi-runner &&\
    useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

RUN apt-get clean && apt-get autoremove -y
VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]