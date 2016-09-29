FROM ubuntu:15.10 
MAINTAINER Christian Ulrich
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget
RUN wget -O /usr/local/bin/gitlab-ci-multi-runner https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-ci-multi-runner-linux-amd64    
RUN chmod +x /usr/local/bin/gitlab-ci-multi-runner
RUN useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
RUN apt-get -y install lazarus libusb-dev libsane-dev
#ADD entrypoint /
#RUN chmod +x /entrypoint
VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]
#ENTRYPOINT ["/usr/bin/dumb-init", "/entrypoint"]
#CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]