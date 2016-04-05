FROM ubuntu:16.04

MAINTAINER Ivan Krutov <vania-pooh@meridor.org>

RUN apt-get update && \
    apt-get -y --force-yes install software-properties-common && \
    add-apt-repository -y ppa:meridor/perspective && \
    apt-get update && \
    apt-get -y install openjdk-8-jre-headless perspective-storage perspective-openstack perspective-rest perspective-shell && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG en_US.UTF-8

RUN locale-gen en_US.UTF-8

EXPOSE 8080 5801

ADD entry_point.sh /usr/bin/entry_point.sh

ENTRYPOINT ["/usr/bin/entry_point.sh"]
