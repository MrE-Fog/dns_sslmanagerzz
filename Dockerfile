FROM debian:11
################################################################################
RUN apt update && \
    apt upgrade && \
    apt -y install passwd lsb-release curl libjson-perl libdatetime-format-dateparse-perl libnet-nslookup-perl libdbi-perl libdbd-mysql-perl git && \
    /bin/rm -f /etc/localtime && \
    /bin/cp /usr/share/zoneinfo/America/New_York /etc/localtime && \
    mkdir /opt/acme && \
    cd /opt/acme && \
    git clone https://github.com/acmesh-official/acme.sh.git
################################################################################
ADD config/sslManager /opt/sslManager
ADD config/startServices.sh /opt/startServices.sh
################################################################################
RUN chmod 755 /opt/startServices.sh && \
    chmod 755 /opt/sslManager
################################################################################
CMD [ "/opt/startServices.sh" ]
