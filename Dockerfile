FROM ubuntu:16.04

RUN apt-get update && \
    apt-get upgrade && \
    echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.0.list && \
    echo "deb http://repo.pritunl.com/stable/apt trusty main" > /etc/apt/sources.list.d/pritunl.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7F0CEB10 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv CF8E292A && \
    apt-get update && apt-get install -y gnupg2 && \
    iptables -A INPUT -p udp -m udp --sport 9700 --dport 1025:65355 -j ACCEPT && \
    iptables -A INPUT -p tcp -m tcp --sport 9700 --dport 1025:65355 -j ACCEPT && \
    # iptables -A INPUT -p `your protocol here` -m `your protocol here` --sport `your_port_here` --dport 1025:65355 -j ACCEPT && \
    apt-get install python-software-properties pritunl mongodb-org && \
    systemctl start mongod pritunl && \
    systemctl enable mongod pritunl 
# service pritunl start
#     service pritunl start
EXPOSE 9700