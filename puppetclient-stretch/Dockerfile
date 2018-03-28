FROM debian:stretch-slim

MAINTAINER lluis

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive && \
      apt -qq update && \
      apt --no-install-recommends install -y wget ca-certificates puppet lsb-release vim-nox bash-completion
