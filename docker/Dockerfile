# Pull base image.
FROM ubuntu:18.04

MAINTAINER Joseph Kordish version: 0.1

ENV DEBIAN_FRONTEND noninteractive

#RUN apt-get -y install software-properties-common && apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get -y update && \
    apt-get -y install ruby ruby-dev build-essential zlib1g-dev libxml2-dev libmysqlclient-dev libsqlite3-dev libmagickwand-dev imagemagick ghostscript
#RUN apt-get purge && apt-get -qy autoremove
#RUN gem install -q --no-ri --no-rdoc risu
RUN git clone git@github.com:hammackj/risu.git && cd risu && git checkout dev

CMD []
