FROM debian:stretch-slim

MAINTAINER lluis

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

ADD apt-sid.list /etc/apt/sources.list.d/sid.list
ADD apt-puppet.pref /etc/apt/preferences.d/10_puppet.pref

# puppedb has broken dependencies in recent sid. use an snapshot
RUN echo 'Acquire::Check-Valid-Until "false";' | tee /etc/apt/apt.conf.d/00snapshot
ADD apt-stable.pref /etc/apt/preferences.d/1_stable.pref

RUN export DEBIAN_FRONTEND=noninteractive && \
      apt -qq update && \
      apt --no-install-recommends install -t sid -y \
      wget ca-certificates puppetdb puppet && \
      apt clean && rm -rf /var/lib/apt/lists/*

# this prevents owner/group change on volumes
# replace 1000 with your uid
RUN usermod -u 1000 puppetdb
RUN groupmod -g 1000 puppetdb

#RUN gem install hiera-http
#
#ADD puppet.conf /etc/puppet/puppet.conf
#
#RUN mv /etc/puppet /etc/puppet.skel
#RUN mv /var/lib/puppet /var/lib/puppet.skel
VOLUME [ "/etc/puppetdb" ]

EXPOSE 8080
EXPOSE 8081

ADD docker-entrypoint /docker-entrypoint
RUN chmod 755 /docker-entrypoint

ENTRYPOINT [ "/docker-entrypoint" ]
