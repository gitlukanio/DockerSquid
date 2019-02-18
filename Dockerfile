FROM resin/raspberrypi3-debian:stretch
MAINTAINER Jianshen Liu <jliu120@ucsc.edu>

RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        dhcpcd5 \
	vim \
	nano
			
ENV SQUID_VERSION=3.5.27 \
    SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy
	
	
RUN apt-get update \
 && apt-get install -y squid* \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 3128/tcp
ENTRYPOINT ["/sbin/entrypoint.sh"]
