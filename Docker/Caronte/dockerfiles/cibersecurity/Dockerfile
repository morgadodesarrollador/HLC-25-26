FROM morgadoberruezo/ubbase
# aplicaciones de CSeg
RUN apt-get update && apt-get install -y \
    nmap \
    iproute2 \
    net-tools \
    procps \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/security/admin 
WORKDIR /root/security

COPY ./dockerfiles/cibersecurity/admin/scan.sh ./admin/scan.sh
RUN chmod +x ./admin/scan.sh

ENTRYPOINT ["/audit/scan.sh"]