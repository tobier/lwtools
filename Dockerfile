FROM alpine:3.11

# Install build tools
RUN apk update && \
    apk upgrade && \
    apk add --no-cache build-base

# Download and build LWTOOLS 4.17
WORKDIR /tmp
RUN wget http://www.lwtools.ca/releases/lwtools/lwtools-4.17.tar.gz && \
    tar xvf lwtools-4.17.tar.gz && \
    make -C /tmp/lwtools-4.17

WORKDIR /opt/lwtools/bin
RUN mv /tmp/lwtools-4.17/lwar/lwar /opt/lwtools/bin && \
    mv /tmp/lwtools-4.17/lwasm/lwasm /opt/lwtools/bin && \
    mv /tmp/lwtools-4.17/lwlink/lwlink /opt/lwtools/bin && \
    rm -rf /tmp/lwtools-*

ENV PATH "$PATH:/opt/lwtools/bin"