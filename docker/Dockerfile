# Pull base image.
FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y install software-properties-common
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get -y update
RUN apt-get -y install ruby2.1 ruby2.1-dev build-essential zlib1g-dev libxml2-dev libmysqlclient-dev libsqlite3-dev libmagickwand-dev libmagickwand5 imagemagick
RUN gem install --no-ri --no-rdoc risu

CMD []
