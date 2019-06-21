FROM debian:buster-slim

MAINTAINER lluis

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive && \
      apt -qq update && \
      apt --no-install-recommends install -y \
      wget ca-certificates puppetdb puppet libservlet3.1-java && \
      apt clean && rm -rf /var/lib/apt/lists/*

# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=924005
RUN wget http://snapshot.debian.org/archive/debian-ports/20181211T033941Z/pool/main/j/jetty9/libjetty9-java_9.4.14-1_all.deb
RUN dpkg -i libjetty9-java_9.4.14-1_all.deb
RUN apt-mark hold libjetty9-java
RUN wget http://snapshot.debian.org/archive/debian-ports/20181211T033941Z/pool/main/j/jetty9/libjetty9-extra-java_9.4.14-1_all.deb
RUN dpkg -i libjetty9-extra-java_9.4.14-1_all.deb
RUN apt-mark hold libjetty9-extra-java


# this prevents owner/group change on volumes
# replace 1000 with your uid
RUN usermod -u 1000 puppetdb
RUN groupmod -g 1000 puppetdb
# add puppetdb to puppet group
RUN usermod puppetdb -a -G puppet

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

#ENTRYPOINT ["sh", "-c", "sleep infinity"] # debug
ENTRYPOINT [ "/docker-entrypoint" ]
