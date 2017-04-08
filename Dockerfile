FROM debian:latest
MAINTAINER Christian Ulrich
RUN set -x && \
    export downloads_url="http://downloads.sourceforge.net/project/lazarus/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.6.2" && \

RUN apt-get -y update && \ 
    apt-get -y upgrade && \ 
    apt-get -y install fpc make binutils build-essential subversion zip unzip wget libusb-dev libsane-dev sqlite3 postgresql-client binutils libgtk2.0-0 libgtk2.0-dev psmisc && \ 

RUN echo "Downloading and installing Debians" && \
    cd /tmp && \
    wget "${downloads_url}/lazarus-project_1.6.2-1_amd64.deb" && \
    dpkg -i lazarus-project_1.6.2-1_amd64.deb && \

RUN wget -O /usr/local/bin/gitlab-ci-multi-runner https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-ci-multi-runner-linux-amd64    
RUN chmod +x /usr/local/bin/gitlab-ci-multi-runner
RUN useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

RUN apt-get clean && apt-get autoremove -y
VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]