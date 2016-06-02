FROM debian:stretch

MAINTAINER lluis

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive && \
      apt-get -qq update && \
      apt-get install -y wget ca-certificates puppetmaster && \
      apt-get clean && rm -rf /var/lib/apt/lists/*

# this prevents owner/group change on volumes
# replace 1000 with your uid
RUN usermod -u 1000 puppet
RUN groupmod -g 1000 puppet

ADD puppet.conf /etc/puppet/puppet.conf

RUN mv /etc/puppet /etc/puppet.skel
RUN mv /var/lib/puppet /var/lib/puppet.skel
VOLUME [ "/etc/puppet" ]
VOLUME [ "/var/lib/puppet" ]

EXPOSE 8140

ADD docker-entrypoint /docker-entrypoint
RUN chmod 755 /docker-entrypoint

ENTRYPOINT [ "/docker-entrypoint" ]