FROM ubuntu:20.04

ARG TARGETARCH
ADD https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64 /usr/bin/ttyd
RUN chmod +x /usr/bin/ttyd
RUN apt-get update && apt-get install -y --no-install-recommends tini && rm -rf /var/lib/apt/lists/*

EXPOSE 7681
WORKDIR /root

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["ttyd", "bash"]
