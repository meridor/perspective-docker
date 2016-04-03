FROM ubuntu:14.04

MAINTAINER Ivan Krutov <vania-pooh@meridor.org>

RUN sudo apt-get update && \
    sudo apt-get -y --force-yes install software-properties-common && \
    sudo add-apt-repository -y ppa:meridor/perspective && \
    sudo add-apt-repository -y ppa:webupd8team/java && \
    sudo apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections && \
    sudo apt-get -y --force-yes install oracle-java8-installer perspective-storage perspective-openstack perspective-rest perspective-shell && \
    sudo apt-get clean

ENV LANG en_US.UTF-8

RUN sudo locale-gen en_US.UTF-8

EXPOSE 8080 5801

ADD entry_point.sh /usr/bin/entry_point.sh

#ENTRYPOINT ["/usr/bin/entry_point.sh"]
