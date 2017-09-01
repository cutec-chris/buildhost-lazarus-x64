FROM debian:latest
MAINTAINER Christian Ulrich

RUN apt-get -y update && \ 
    apt-get -y install git sudo fpc fpc-source binutils build-essential zip unzip wget libusb-dev libsane-dev sqlite3 postgresql-client binutils libgtk2.0-0 libgtk2.0-dev psmisc subversion
RUN apt-get clean && apt-get autoremove -y

RUN cd /tmp
RUN svn checkout http://svn.freepascal.org/svn/lazarus/trunk/ lazarus
RUN cd lazarus
RUN make bigide
RUN make install
