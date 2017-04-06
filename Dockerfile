FROM debian:latest
MAINTAINER Christian Ulrich
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget git zip sshpass sudo
RUN wget -O /usr/local/bin/gitlab-ci-multi-runner https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-ci-multi-runner-linux-amd64    
RUN chmod +x /usr/local/bin/gitlab-ci-multi-runner
RUN useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
RUN apt-get -y install lazarus libusb-dev libsane-dev sqlite3 postgresql-client
RUN gpg --keyserver hkp://pgp.mit.edu:11371 --recv-keys 6A11800F && \
    gpg --export 6A11800F | sudo apt-key add - &&  \
    echo "deb http://www.hu.freepascal.org/lazarus/ lazarus-stable universe" > lazarus.list && \
    sudo mv -v lazarus.list  /etc/apt/sources.list.d/lazarus.list
RUN sudo apt-get update && \
    sudo apt-get install -t lazarus-stable lazarus
RUN apt-get clean && apt-get autoremove -y
VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]