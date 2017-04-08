FROM debian:latest
MAINTAINER Christian Ulrich
RUN apt-get -y update && \ 
    apt-get -y upgrade && \ 
    apt-get -y install make binutils build-essential subversion zip unzip wget libusb-dev libsane-dev sqlite3 postgresql-client && \ 
    cd /tmp && \ 
    mkdir fpcSetup && \ 
    cd fpcSetup && \ 
    wget https://github.com/LongDirtyAnimAlf/Reiniero-fpcup/releases/download/1.2.0j/fpcup-$(uname -m)-linux && \ 
    chmod +x fpcup-$(uname -m)-linux && \ 
    ./fpcup-$(uname -m)-linux --noconfirm --fpcURL="2.6.4" --fpcOPT="-O4" --crossOPT="-O4" clean && \ 
    ./fpcup-$(uname -m)-linux --noconfirm --fpcURL="2.6.4" --fpcOPT="-O4" --crossOPT="-O4" --cputarget=i386 --ostarget=win32 --only="FPCCleanOnly,FPCBuildOnly" && \ 
    ./fpcup-$(uname -m)-linux --noconfirm --fpcURL="2.6.4" --fpcOPT="-O4" --crossOPT="-O4" --cputarget=x86_64 --ostarget=win64 --only="FPCCleanOnly,FPCBuildOnly" && \ 
    cd / && \ rm -rf /tmp/fpcSetup
#RUN apt-get update -y && \
#    apt-get upgrade -y && \
#    apt-get install -y wget git zip sshpass sudo
RUN wget -O /usr/local/bin/gitlab-ci-multi-runner https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-ci-multi-runner-linux-amd64    
RUN chmod +x /usr/local/bin/gitlab-ci-multi-runner
RUN useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
#RUN apt-get -y install libusb-dev libsane-dev sqlite3 postgresql-client fpc
#RUN gpg --keyserver hkp://pgp.mit.edu:11371 --recv-keys 6A11800F && \
#    gpg --export 6A11800F | sudo apt-key add - &&  \
#    echo "deb http://www.hu.freepascal.org/lazarus/ lazarus-stable universe" > lazarus.list && \
#    sudo mv -v lazarus.list  /etc/apt/sources.list.d/lazarus.list
#RUN sudo apt-get update && \
#    sudo apt-get install -y -t lazarus-stable lazarus
RUN apt-get clean && apt-get autoremove -y
RUN git clone --depth=5 https://github.com/graemeg/lazarus.git
RUN cd lazarus && \
    make all bigide && \
    sudo make install
VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]