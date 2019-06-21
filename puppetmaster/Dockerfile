FROM debian:buster-slim

MAINTAINER lluis

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive && \
      apt -qq update && \
      apt --no-install-recommends install -y \
      wget ca-certificates puppetmaster puppet-terminus-puppetdb libservlet3.1-java && \
      apt clean && rm -rf /var/lib/apt/lists/*

# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=924005
RUN wget http://snapshot.debian.org/archive/debian-ports/20181211T033941Z/pool/main/j/jetty9/libjetty9-java_9.4.14-1_all.deb
RUN dpkg -i libjetty9-java_9.4.14-1_all.deb
RUN apt-mark hold libjetty9-java

# this prevents owner/group change on volumes
# replace 1000 with your uid
RUN usermod -u 1000 puppet
RUN groupmod -g 1000 puppet

RUN gem install hiera-http

#ADD puppet.conf /etc/puppet/puppet.conf

#RUN mv /etc/puppet /etc/puppet.skel
#VOLUME [ "/etc/puppet" ]

#RUN mv /var/lib/puppet /var/lib/puppet.skel
#VOLUME [ "/var/lib/puppet" ]

EXPOSE 8140

ADD docker-entrypoint /docker-entrypoint
RUN chmod 755 /docker-entrypoint

ENTRYPOINT [ "/docker-entrypoint" ]
