FROM debian:wheezy-slim

MAINTAINER lluis

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

ENV PUPPET_AGENT_VERSION="5.5.0" DEBIAN_CODENAME="wheezy"

RUN echo 'export PATH=$PATH:/opt/puppetlabs/bin/' | tee /root/.bashrc_local

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -qq update && \
    apt-get install -y wget && \
    wget --no-check-certificate https://apt.puppetlabs.com/puppet5-release-"$DEBIAN_CODENAME".deb && \
    dpkg -i puppet5-release-"$DEBIAN_CODENAME".deb && \
    rm puppet5-release-"$DEBIAN_CODENAME".deb && \
    apt-get update && \
    apt-get install --no-install-recommends -y puppet-agent="$PUPPET_AGENT_VERSION"-1"$DEBIAN_CODENAME" lsb-release vim-nox bash-completion
