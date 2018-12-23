# Dockerfile

FROM alpine:3.7

RUN apk add --no-cache git build-base abuild binutils libtool libpcap-dev autoconf make automake 
RUN mkdir -p /usr/local/nDPI
WORKDIR /usr/local/nDPI
RUN git clone https://github.com/oifergan/nDPI.git
WORKDIR /usr/local/nDPI/nDPI
COPY 10cap.pcap .
RUN autoreconf -fi && ./configure
RUN make && make install
