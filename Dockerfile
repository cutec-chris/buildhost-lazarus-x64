FROM debian:latest
MAINTAINER Christian Ulrich

RUN apt-get -y update && \ 
    apt-get -y install git sudo fpc fpc-source binutils build-essential zip unzip wget libusb-dev libsane-dev sqlite3 postgresql-client binutils libgtk2.0-0 libgtk2.0-dev psmisc subversion
RUN apt-get clean && apt-get autoremove -y

RUN echo "Downloading and installing Debians" && \
    cd /tmp && \
    wget "${downloads_url}/lazarus-project_1.6.2-1_amd64.deb" && \
    dpkg -i lazarus-project_1.6.2-1_amd64.deb