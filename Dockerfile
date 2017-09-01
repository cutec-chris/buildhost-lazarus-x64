FROM debian:latest
MAINTAINER Christian Ulrich

RUN apt-get -y update && \ 
    apt-get -y install git sudo fpc fpc-source binutils build-essential zip unzip wget libusb-dev libsane-dev sqlite3 postgresql-client binutils libgtk2.0-0 libgtk2.0-dev psmisc subversion
RUN apt-get clean && apt-get autoremove -y

RUN echo "Downloading and installing Debians" && \
    cd /tmp && \
    wget "https://downloads.sourceforge.net/project/lazarus/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.6/lazarus_1.6-0_amd64.deb?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Flazarus%2Ffiles%2FLazarus%2520Linux%2520amd64%2520DEB%2FLazarus%25201.6%2F&ts=1504309423&use_mirror=10gbps-io" -O lazarus.deb
RUN ls /tmp/* && \
    dpkg -i --force-depends /tmp/lazarus.deb